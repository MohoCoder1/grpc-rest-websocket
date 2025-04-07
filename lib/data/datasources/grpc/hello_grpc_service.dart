import 'package:task_hub/core/grpc_config.dart';

import '../../../generated/hello.pbgrpc.dart';

class HelloGrpcService{
  final GrpcConfig grpc;

  HelloGrpcService({required this.grpc});

  Future<String> sendHello({required String message}) async {
    try {
      final response = await grpc.client.sayHello(HelloRequest()..greeting = message);
      return response.reply;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}