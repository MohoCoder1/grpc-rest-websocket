


import 'package:get/get.dart';
import 'package:task_hub/domain/usecases/say_hello_use_case.dart';

class HelloGrpcController extends GetxController{
  final SayHelloUseCase sayHelloUseCase;

  HelloGrpcController({required this.sayHelloUseCase});

  var message = ''.obs;


  Future<void> sayHello(String name) async {
    try {
      final response = await sayHelloUseCase(name);
      message.value = response.message;
    } catch (e) {
      // Handle error
    }
  }

}