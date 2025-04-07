import 'package:dio/dio.dart';
import 'package:task_hub/data/models/todo.dart';

class TodoRestService {
  // This class will contain methods to interact with the Todo API
  // For example, fetching todos, adding a new todo, updating a todo, etc.
  // You can use Dio or http package for making API calls

  final _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com/todos';


  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await _dio.get(baseUrl);
      final List data = response.data;
      if(data.isNotEmpty) {
        return data.map((todo) => Todo.fromJson(todo)).toList();
      }
      return[];
    } catch (e) {
      print('Error fetching todos: $e');
      rethrow;
    }
  }
}