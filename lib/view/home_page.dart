import 'package:flutter/material.dart';
import 'package:todo_sqfl/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _constroller = TextEditingController();
  List todoListArray = [
    ['Learn Flutter', false],
    ['Coffee', false],
  ];

  changedCheckBox(int index){
    setState(() {
      todoListArray[index][1] = !todoListArray[index][1]; 
    });
  }
  saveNewTask(){
    setState(() {
      todoListArray.add([_constroller.text, false]);
      _constroller.clear();
    });
  }
  deleteTask(int index){
    setState(() {
      todoListArray.removeAt(index);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade300,
        appBar: AppBar(
          title: const Text('Simple todo'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: todoListArray.length,
            itemBuilder: (BuildContext context, index) {
              return TodoList(
                taskName: todoListArray[index][0],
                isCompleted: todoListArray[index][1],
                onChanged: (value)=> changedCheckBox(index),
                deleteFunction: (context) => deleteTask(index) ,
              );
            }),
            floatingActionButton: Row(
              children: [
                 Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _constroller,
                    decoration: InputDecoration(
                      hintText: 'Add new todo item',
                      filled: true,
                      fillColor: Colors.deepPurple.shade200,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                )),
                FloatingActionButton(
                  onPressed: saveNewTask,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            );
  }
}
