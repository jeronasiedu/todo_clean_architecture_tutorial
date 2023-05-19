import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/todo/domain/entities/todo.dart';
import 'package:todo_clean/features/todo/domain/usecases/add.dart';
import 'package:todo_clean/shared/utils/usecase.dart';

class TodoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final AddTodoUseCase addTodoUseCase;

  TodoController({
    required this.addTodoUseCase,
  });

  Future<void> addTodo() async {
    final results = await addTodoUseCase(Params(
      Todo(
        id: generateRandomId(10),
        text: titleController.text.trim(),
        description: descriptionController.text.trim(),
      ),
    ));
    results.fold((failure) {
      print(failure.message);
      Get.snackbar("Error", failure.message);
    }, (todo) {
      // clear form
      titleController.clear();
      descriptionController.clear();
      Get.snackbar("Success", "Todo added successfully");
    });
  }

  String generateRandomId(int length) {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final id = StringBuffer();

    for (var i = 0; i < length; i++) {
      id.write(chars[random.nextInt(chars.length)]);
    }

    return id.toString();
  }
}
