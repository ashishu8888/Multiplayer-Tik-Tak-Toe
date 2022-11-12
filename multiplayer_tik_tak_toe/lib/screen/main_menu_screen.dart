import 'package:flutter/material.dart';
import 'package:multiplayer_tik_tak_toe/responsive/responsive.dart';
import 'package:multiplayer_tik_tak_toe/screen/create_room_screen.dart';
import 'package:multiplayer_tik_tak_toe/screen/join_room_screen.dart';
import 'package:multiplayer_tik_tak_toe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static const routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                ontap: () {
                  Navigator.of(context).pushNamed(CreateRoomScreen.routeName);
                },
                text: 'Create Room',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                ontap: () {
                  Navigator.of(context).pushNamed(JoinRoomScreen.routeName);
                },
                text: 'Join Room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
