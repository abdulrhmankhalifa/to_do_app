import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String nameOfButton;
  VoidCallback onPressed;
  Button({super.key, required this.nameOfButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        nameOfButton,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
