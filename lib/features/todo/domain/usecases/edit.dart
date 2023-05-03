import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class EditTodoUseCase implements UseCase<Todo, Params<Todo>> {
  final TodoRepository repository;
  EditTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params<Todo> params) {
    return repository.edit(params.data);
  }
}
