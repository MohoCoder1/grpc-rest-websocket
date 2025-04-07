import 'package:task_hub/domain/repositories/i_echo_socket_repository.dart';

class SendEchoMessageUseCase {
  final IEchoSocketRepository _echoSocketRepository;

  SendEchoMessageUseCase(this._echoSocketRepository);

  void call(String message) {
    _echoSocketRepository.sendMessage(message);
  }
}
