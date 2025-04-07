
import 'package:task_hub/data/datasources/rest/todo_rest_service.dart';
import 'package:task_hub/domain/entities/i_todo.dart';

import '../../domain/repositories/i_todo_rest_repository.dart';


class TodoRestRepository extends ITodoRestRepository {
  final TodoRestService apiService;

  TodoRestRepository({required this.apiService});

  @override
  Future<void> addTodo(ITodo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<ITodo> getTodo(int id) {
    // TODO: implement getTodo
    throw UnimplementedError();
  }

  @override
  Future<List<ITodo>> getTodos() {
    return apiService.fetchTodos();
  }

  @override
  Future<void> updateTodo(ITodo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
