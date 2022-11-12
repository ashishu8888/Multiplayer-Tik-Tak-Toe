const mongoonse = require('mongoose');

const playerSchema = new mongoonse.Schema({
    nickname: {
        type: String,
        trim: true,
    },
    socketID: {
        type: String,
        
    },
    points: {
        type: Number,
        default: 0
    },
    playerType: {
        required: true,
        type: String,
    },
});

module.exports = playerSchema;