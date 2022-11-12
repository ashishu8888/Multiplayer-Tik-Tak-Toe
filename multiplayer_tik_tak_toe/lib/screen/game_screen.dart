import 'package:flutter/material.dart';
import 'package:multiplayer_tik_tak_toe/resources/socket_methods.dart';
import 'package:multiplayer_tik_tak_toe/views/score_board.dart';
import 'package:multiplayer_tik_tak_toe/views/tictactoe_board.dart';
import 'package:multiplayer_tik_tak_toe/views/waiting_lobby.dart';
import 'package:provider/provider.dart';
import '../provider/room_data.dart';

class gameScreen extends StatefulWidget {
  static const routeName = '/game';
  const gameScreen({Key? key}) : super(key: key);

  @override
  State<gameScreen> createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    // print(Provider.of<RoomDataProvider>(context).player1.nickname);
    // print(Provider.of<RoomDataProvider>(context).player2.nickname);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Scoreboard(),
                  const TicTacToeBoard(),
                  Text('${roomDataProvider.roomData['turn']['nickname']}\'s'),
                ],
              ),
            ),
    );
  }
}
