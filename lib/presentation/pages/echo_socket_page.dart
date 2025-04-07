

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/echo_socket_controller.dart';

class EchoSocketPage extends StatelessWidget {
   EchoSocketPage({super.key});

 final controller = Get.find<EchoSocketController>();
 final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo Socket Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Obx(() {


              if (controller.message.isEmpty) {
                return const Center(child: Text('No messages yet.'));
              }

              return ListView.builder(
                itemCount: controller.message.length,
                itemBuilder: (context, index) {
                  final message = controller.message[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(message.message),
                    ),
                  );
                },
              );
            })),
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
                    controller.sendMessage(_textController.text);
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
