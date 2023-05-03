import 'package:dartz/dartz.dart';

import 'package:todo_clean/shared/errors/failure.dart';

import '../../../../shared/utils/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<Todo, Params<Todo>> {
  final TodoRepository repository;
  DeleteTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) {
    return repository.delete(params.data);
  }
}
