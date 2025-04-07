import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hub/presentation/controllers/todo_rest_controller.dart';

class TodoRestPage extends StatelessWidget {
  const TodoRestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoRestController>();
    controller.fetchTodos();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.todos.isEmpty) {
          return const Center(child: Text('No todos found.'));
        }

        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(todo.title),
                subtitle: Icon(
                  todo.completed ? Icons.check : Icons.close,
                  color: todo.completed ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
