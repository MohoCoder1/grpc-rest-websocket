

import 'package:task_hub/domain/entities/i_hello_message.dart';
import 'package:task_hub/domain/repositories/i_hello_grpc_repository.dart';

class SayHelloUseCase{
  final IHelloGrpcRepository repository;

  SayHelloUseCase({required this.repository});

  Future<IHelloMessage> call(String name) async {
    return await repository.sayHello(name);
  }

}