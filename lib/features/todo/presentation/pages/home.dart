import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/todo_controller.dart';

class HomePage extends GetView<TodoController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Clean Architecture'),
      ),
      body: StreamBuilder(
        stream: controller.listTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            if (todos.isEmpty) {
              return const Center(
                child: Text("No todos found"),
              );
            }

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].text),
                  subtitle: Text(todos[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          controller.deleteTodo(todos[index]);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Title',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: controller.descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description is required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                controller.addTodo();
                                // pop the bottom sheet
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
