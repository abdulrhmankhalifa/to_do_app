import 'package:flutter/material.dart';
import 'package:to_do_app/resources/button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF390000),
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Color.fromARGB(255, 202, 192, 192)),
              decoration: const InputDecoration(
                hintText: "Add New Task Here.",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  nameOfButton: "Save",
                  onPressed: onSave,
                ),
                Button(
                  nameOfButton: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
