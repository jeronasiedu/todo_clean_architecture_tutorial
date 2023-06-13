import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/todo/domain/entities/todo.dart';
import 'package:todo_clean/features/todo/domain/usecases/add.dart';
import 'package:todo_clean/shared/utils/usecase.dart';

import '../../../../shared/utils/random_id.dart';
import '../../domain/usecases/list.dart';

class TodoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final AddTodoUseCase addTodoUseCase;
  final ListTodoUseCase listTodoUseCase;

  TodoController({
    required this.addTodoUseCase,
    required this.listTodoUseCase,
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

  Stream<List<Todo>> listTodo() async* {
    final results = await listTodoUseCase(NoParams());
    yield* results.fold((failure) {
      print(failure.message);
      Get.snackbar("Error", failure.message);
      return Stream.value([]);
    }, (todo) {
      return todo;
    });
  }
}
