import 'package:get/get.dart';
import 'package:todo_clean/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_clean/features/todo/domain/usecases/add.dart';
import 'package:todo_clean/features/todo/presentation/controller/todo_controller.dart';

import '../../data/database/todo_remote_database.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoRemoteDatabaseImpl());
    Get.lazyPut(() => TodoRepositoryImpl(remoteDatabase: Get.find<TodoRemoteDatabaseImpl>()));
    Get.lazyPut(() => AddTodoUseCase(Get.find<TodoRepositoryImpl>()));
    Get.lazyPut(() => TodoController(Get.find<AddTodoUseCase>()));
  }
}