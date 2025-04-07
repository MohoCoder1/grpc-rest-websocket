

abstract class IEchoMessage{
  final String message;

  IEchoMessage({
    required this.message,
  });

  IEchoMessage copyWith({
    String? message,
  });
}