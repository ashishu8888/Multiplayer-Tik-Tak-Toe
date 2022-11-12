import 'package:flutter/material.dart';
import 'package:multiplayer_tik_tak_toe/provider/room_data.dart';
import 'package:multiplayer_tik_tak_toe/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   roomIdController = TextEditingController(
  //     text: Provider.of<RoomDataProvider>(context).roomData['_id'],
  //   );
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    roomIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context).roomData['_id']);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for a player to join..'),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: roomIdController,
          hintText: '',
          isReadOnly: true,
        )
      ],
    );
  }
}
