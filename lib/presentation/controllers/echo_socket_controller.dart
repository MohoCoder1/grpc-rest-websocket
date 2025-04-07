

import 'package:get/get.dart';
import 'package:task_hub/domain/entities/i_echo_message.dart';
import 'package:task_hub/domain/repositories/i_echo_socket_repository.dart';
import 'package:task_hub/domain/usecases/send_echo_message_use_case.dart';

class EchoSocketController extends GetxController{
  final SendEchoMessageUseCase sendEchoMessageUseCase;
  final IEchoSocketRepository echoSocketRepository;

  EchoSocketController({required this.sendEchoMessageUseCase, required this.echoSocketRepository});

  var message = <IEchoMessage>[].obs;

  @override
  void onInit() {
    echoSocketRepository.connect().then((_) {
      print('Connected to WebSocket');
    }).catchError((error) {
      print('Error connecting to WebSocket: $error');
    });

   echoSocketRepository.messages.listen((event){
      message.add(event);
      print('Message received: $event');
    });

    super.onInit();
  }


  void sendMessage(String message)   {
    try {
         sendEchoMessageUseCase(message);
    } catch (e) {
      // Handle error
    }
  }

  @override
  void onClose() {
    echoSocketRepository.disconnect();
    super.onClose();
  }
}