import 'package:flutter/material.dart';
import 'package:multiplayer_tik_tak_toe/resources/socket_methods.dart';
import 'package:multiplayer_tik_tak_toe/responsive/responsive.dart';
import 'package:multiplayer_tik_tak_toe/widgets/custom_button.dart';
import 'package:multiplayer_tik_tak_toe/widgets/custom_text.dart';
import 'package:multiplayer_tik_tak_toe/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  static const routeName = '/create-roomScreen';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    print('ji');
    // TODO: implement initState
    super.initState();

    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    // toavoid memory leaks
    // TODO: implement dispose
    super.dispose();

    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: size.height * 0.150),
        child: Responsive(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  shadow: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    ),
                  ],
                  text: 'Create Room',
                  fontSize: 70,
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                    controller: _nameController,
                    hintText: 'Enter your nickname'),
                SizedBox(
                  height: size.height * 0.045,
                ),
                CustomButton(
                    ontap: () {
                      _socketMethods.createRoom(_nameController.text);
                      print(_nameController.text);
                    },
                    text: 'Create')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
