import 'package:flutter/material.dart';
import 'package:slideable/Slideable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String NameOfTask;
  // ignore: non_constant_identifier_names
  final bool TaskCompleted;
  Function(bool?)? onChanged;
  void Function() deleteFunction;
  // ignore: non_constant_identifier_names
  TodoTile(
      {super.key,
      required this.NameOfTask,
      required this.TaskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        right: 10,
        left: 10,
      ),
      child: Slideable(
        items: [
          ActionItems(
            radius: BorderRadius.circular(8),
            backgroudColor: Colors.black,
            icon: const Icon(
              Icons.delete,
              color: Color(0xFF390000),
            ),
            onPress: deleteFunction,
          ),
        ],
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF390000),
          ),
          child: Row(
            children: [
              Checkbox(
                value: TaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                NameOfTask,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  decoration: TaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
