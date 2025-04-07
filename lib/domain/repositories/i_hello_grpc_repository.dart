

import 'package:task_hub/domain/entities/i_hello_message.dart';

abstract class IHelloGrpcRepository {
  Future<IHelloMessage> sayHello(String name);
  Stream<String> lotsOfReplies(String name);
  Stream<String> lotsOfGreetings(Stream<String> names);
  Stream<String> bidiHello(Stream<String> names);
}