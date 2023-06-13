import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/usecase.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class ListTodoUseCase implements UseCase<Stream<List<Todo>>, NoParams> {
  final TodoRepository repository;

  ListTodoUseCase(this.repository);

  @override
  Future<Either<Failure, Stream<List<Todo>>>> call(NoParams params) {
    return repository.getAll();
  }
}
