import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/todo/domain/usecases/add.dart';
import 'package:todo_clean/shared/errors/failure.dart';
import 'package:todo_clean/shared/utils/usecase.dart';

import '../../domain/entities/todo.dart';
class TodoController extends GetxController{
final AddTodoUseCase addTodoUseCase;
TodoController(this.addTodoUseCase);

Future<void> addTodo() async{
   final todo = Todo(id: '1', text: "Example todo", description: "This is a sample todo");
   final results = await addTodoUseCase(Params<Todo>(todo));
   results.fold((failure) {
      Get.snackbar("Failure", failure.message);
   }, (success) =>{
   Get.snackbar("Success", "${success.text} was added")
   });
}
Future<Either<Failure,Todo>> addTodoExample() async{
   final todo = Todo(id: '1', text: "Example todo", description: "This is a sample todo");
   final results = await addTodoUseCase(Params<Todo>(todo));
   return results;
}
}