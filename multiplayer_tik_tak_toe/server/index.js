//importing mudules
const express = require('express');
const http = require('http');
const mongoose = require("mongoose");
//const { isObject } = require('util');
const app = express();

const port = process.env.PORT || 3000;
var server = http.createServer(app);

const Room = require('./models/room')

var io = require("socket.io")(server);
// middle ware
// client -> middleware ->  server
app.use(express.json());

const DB = "mongodb+srv://ashish:test123@cluster0.s7iuk.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("connected!");
    socket.on("createRoom", async ({ nickname }) => {
        console.log(nickname);
        //room is created(server side event)
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname: nickname,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn = player;
            room = await room.save();

            const roomId = room._id.toString();

            socket.join(roomId);
            // io -> send data to everyone
            // socket -> sending data to yourself
            io.to(roomId).emit('createRoomSuccess', room);
            //console.log(room);
        }
        catch (e)
        {
            console.log(e);
        }

        // player is stored in the room
        // player is taken to the next screen
    });

    socket.on('joinRoom', async ({ nickname, roomId }) => {
        try {
            if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit('errorOccurred', 'Please enter a valid room ID.');
                return;
            }
            
            let room = await Room.findById(roomId);
    
            if (room.isJoin) {
                let player = {
                    nickname,
                    socketID: socket.id,
                    playerType: 'O',
                };
                socket.join(roomId);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                io.to(roomId).emit('joinRoomSuccess', room);
                io.to(roomId).emit('updatePlayers', room.players);
                io.to(roomId).emit('updateRoom', room);
            }
            else {
                socket.emit("errorOccurred", 'The game is in progress, try again later.');
                //  return;
            }
        } catch (e) {
            console.log(e);
        }
    });

    socket.on('tap', async ({ index, roomId }) => {
        try {
            let room = await Room.findById(roomId);
            let choice = room.turn.playerType;
            if (room.turnIndex == 0) {
                room.turn = room.players[1];
                room.turnIndex = 1;
            }
            else {
                room.turn = room.players[0];
                room.turnIndex = 0;
            } 
            room = await room.save();
            io.to(roomId).emit('tapped', {
                index,
                choice,
                room,
            });
        } catch (e) {
            console.log(e);
        }
    });
});

mongoose.connect(DB).then(() => {
    console.log("Connection successful");
}).catch((e) => {
    console.log(e);
});
// promise in js  = Future in dart

server.listen(port, '0.0.0.0', ()=>{
    console.log(`server started an running on port ${port}`)
});