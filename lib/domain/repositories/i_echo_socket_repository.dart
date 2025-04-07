

import 'package:task_hub/domain/entities/i_echo_message.dart';

abstract class IEchoSocketRepository {
  Future<void> connect();
  void disconnect();
  void sendMessage(String message);
  Stream<IEchoMessage> get messages;
}