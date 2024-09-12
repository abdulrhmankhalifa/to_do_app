import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List ToDo = [];

  final myBox = Hive.box('Box');

  void createNewData() {
    ToDo = [
      ['Welcome To Your To Do List', false],
    ];
  }

  void loadData() {
    ToDo = myBox.get('Gj');
  }

  void updateList() {
    myBox.put("Gj", ToDo);
  }
}
