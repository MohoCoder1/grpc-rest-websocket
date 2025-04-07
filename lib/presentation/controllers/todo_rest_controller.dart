

import 'package:get/get.dart';
import 'package:task_hub/domain/usecases/get_todos_use_case.dart';

import '../../domain/entities/i_todo.dart';

class TodoRestController extends GetxController{
  final GetTodosUseCase getTodosUseCase;

  TodoRestController({required this.getTodosUseCase});

  var todos = <ITodo>[].obs;
  var isLoading = true.obs;

  void fetchTodos() async {
    isLoading.value = true;
    try {
      todos.value = await getTodosUseCase();
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

}