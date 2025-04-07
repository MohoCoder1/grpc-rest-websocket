

import 'package:task_hub/domain/entities/i_todo.dart';
import 'package:task_hub/domain/repositories/i_todo_rest_repository.dart';


class GetTodosUseCase {
  final ITodoRestRepository repository;

  GetTodosUseCase(this.repository);

  Future<List<ITodo>> call() async {
    return await repository.getTodos();
  }
}