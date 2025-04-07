import 'package:task_hub/domain/entities/i_echo_message.dart';

class EchoMessage extends IEchoMessage {
  EchoMessage({required super.message});

  factory EchoMessage.fromJson(Map<String, dynamic> json) {
    return EchoMessage(message: json['message'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  EchoMessage copyWith({int? id, String? message, DateTime? createdAt}) {
    return EchoMessage(message: message ?? this.message);
  }
}
