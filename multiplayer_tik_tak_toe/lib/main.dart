import 'package:flutter/material.dart';
import 'package:multiplayer_tik_tak_toe/provider/room_data.dart';
import 'package:multiplayer_tik_tak_toe/screen/create_room_screen.dart';
import 'package:multiplayer_tik_tak_toe/screen/game_screen.dart';
import 'package:multiplayer_tik_tak_toe/screen/join_room_screen.dart';
import 'package:multiplayer_tik_tak_toe/screen/main_menu_screen.dart';
import 'package:multiplayer_tik_tak_toe/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
        home: const MainMenuScreen(),
        initialRoute: MainMenuScreen.routeName,
        routes: {
          MainMenuScreen.routeName: (ctx) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (ctx) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (ctx) => const CreateRoomScreen(),
          gameScreen.routeName: (ctx) => const gameScreen(),
        },
      ),
    );
  }
}
