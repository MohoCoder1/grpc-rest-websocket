import 'package:task_hub/data/datasources/websocket/echo_socket_service.dart';
import 'package:task_hub/data/models/echo_message.dart';
import 'package:task_hub/domain/entities/i_echo_message.dart';
import 'package:task_hub/domain/repositories/i_echo_socket_repository.dart';

class EchoSocketRepository extends IEchoSocketRepository {
  final EchoSocketService service;

  EchoSocketRepository({required this.service});

  @override
  Future<void> connect() {
    return service.connect();
  }

  @override
  void disconnect() {
    return service.disconnect();
  }

  @override
  Stream<IEchoMessage> get messages =>
      service.messages.map((e) => EchoMessage(message: e));

  @override
  void sendMessage(String message) {
    return service.sendMessage(message);
  }
}
