

import '../entities/i_todo.dart';

abstract class ITodoRestRepository {
  Future<List<ITodo>> getTodos();
  Future<ITodo> getTodo(int id);
  Future<void> addTodo(ITodo todo);
  Future<void> updateTodo(ITodo todo);
  Future<void> deleteTodo(int id);
}