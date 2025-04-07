


import 'package:task_hub/data/datasources/grpc/hello_grpc_service.dart';
import 'package:task_hub/domain/entities/i_hello_message.dart';
import 'package:task_hub/domain/repositories/i_hello_grpc_repository.dart';

import '../models/hello_message.dart';

class HelloGrpcRepository extends IHelloGrpcRepository{
  final HelloGrpcService service;

  HelloGrpcRepository({required this.service});

  @override
  Stream<String> bidiHello(Stream<String> names) {
    // TODO: implement bidiHello
    throw UnimplementedError();
  }

  @override
  Stream<String> lotsOfGreetings(Stream<String> names) {
    // TODO: implement lotsOfGreetings
    throw UnimplementedError();
  }

  @override
  Stream<String> lotsOfReplies(String name) {
    // TODO: implement lotsOfReplies
    throw UnimplementedError();
  }

  @override
  Future<IHelloMessage> sayHello(String name) async{
   final response = await service.sendHello(message: name);
    return HelloMessage(
      message: response,
    );

  }

}