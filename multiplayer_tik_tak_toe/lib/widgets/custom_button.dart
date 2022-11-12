import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const CustomButton({
    Key? key,
    required this.ontap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 0,
        )
      ]),
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 9, 15, 132),
            elevation: 10,
            minimumSize: Size(
              width * 0.8,
              50,
            )),
        onPressed: ontap,
      ),
    );
  }
}
