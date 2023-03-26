import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class AddTodoUseCase implements UseCase<Todo, Todo> {
  final TodoRepository repository;
  AddTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Todo todo) async {
    return await repository.add(todo);
  }
}
