import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/dataBase.dart';
import 'package:to_do_app/resources/todoTile.dart';

import 'completed.dart';
import 'incompleted.dart';
import 'resources/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  final myBox = Hive.box('Box');
  Database db = Database();

  @override
  void initState() {
    if (myBox.get("Gj") == null) {
      db.createNewData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final controller = TextEditingController();
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDo[index][1] = !db.ToDo[index][1];
    });
    db.updateList();
  }

  void saveNewTask() {
    setState(() {
      db.ToDo.add([controller.text, false]);
      controller.clear();
    });
    db.updateList();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        });
    db.updateList();
  }

  void deleteTask(int index) {
    setState(() {
      db.ToDo.removeAt(index);
    });
    db.updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const completedPage()),
              );
            },
            child: const Text(
              'complete',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const incompletedPage()),
              );
            },
            child: const Text(
              'incomplete',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        elevation: 0,
        title: const Text(
          'To-Do',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF390000),
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: db.ToDo.length,
        itemBuilder: (context, index) {
          return TodoTile(
            NameOfTask: db.ToDo[index][0],
            TaskCompleted: db.ToDo[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunction: () => deleteTask(index),
          );
        },
      ),
    );
  }
}
