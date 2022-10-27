import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData iconButton;
  final String labelButton;

  const CustomButton(
      {super.key, required this.iconButton, required this.labelButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(labelButton),
        SizedBox(
          width: 10,
        ),
        Icon(iconButton)
      ]),
    );
  }
}
