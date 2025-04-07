import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_hub/data/datasources/grpc/hello_grpc_service.dart';

import '../controllers/hello_grpc_controller.dart';


class HelloGrpcPage extends StatelessWidget {
    HelloGrpcPage({super.key});
  final controller = Get.find<HelloGrpcController>();
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Grpc Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(child: Obx(() {
                  if (controller.message.isEmpty) {
                    return const Center(child: Text('No messages yet.'));
                  }
                  return Text('${controller.message}');
                })),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Enter message',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.sayHello(_textController.text);
                    _textController.clear();
                  },
                  child: const Text('Send Message'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
