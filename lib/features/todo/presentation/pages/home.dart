import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/todo/presentation/controller/todo_controller.dart';

class HomePage extends GetView<TodoController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Clean'),
        ),
        body: Center(
          child: Text("Hello Wolrd"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:  () async{
          final results = await controller.addTodoExample();
          results.fold((l) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.message)));
          }, (r) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r.text)))
          });
          },
          child: const Icon(Icons.add),
        )

    );
  }
}
