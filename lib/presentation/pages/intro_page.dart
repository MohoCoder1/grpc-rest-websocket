

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hub/presentation/pages/echo_socket_page.dart';
import 'package:task_hub/presentation/pages/hello_grpc_page.dart';

import 'package:task_hub/presentation/pages/todo_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to the Intro Page!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(TodoRestPage());
              },
              child: const Text('Go to Todo Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(HelloGrpcPage());
              },
              child: const Text('Go to Grpc Test Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(EchoSocketPage());
              },
              child: const Text('Go to Socket Test Page'),
            )
          ],
        ),
      ),
    );
  }
}
