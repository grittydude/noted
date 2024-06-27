import 'package:flutter/material.dart';
import 'package:todo/util/dialog_widget.dart';
import 'package:todo/util/note_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List toDoList = [
    ['Sign up for KodeCamp 4.0', false],
    ['Watch Youtube video', false],
  ];
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
      print(toDoList);
    });
    Navigator.of(context).pop();
  }

  void createNewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 2, 38),
        appBar: AppBar(
          title: const Text(
            'Noted',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 3, 2, 34),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewtask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return NoteTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteNote: (cotext) => deleteTask(index),
            );
          },
        ));
  }
}
