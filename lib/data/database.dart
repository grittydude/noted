import 'package:hive/hive.dart';

class NotedDatabase {
  List todoList = [];

  //reference box
  final _box = Hive.box('note_box');

  void createInitialData() {
    todoList = [
      ['Create a note', false]
    ];
  }
  //load the data from database
  void loadData() {
    todoList = _box.get('NOTEDLIST');
  }

  //update database
  void updateDatabase() {
    _box.put('NOTEDLIST', todoList);
  }
}
