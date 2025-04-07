

import 'package:grpc/grpc.dart';

import '../generated/hello.pbgrpc.dart';

class GrpcConfig {
  late final ClientChannel _channel;
  late final HelloServiceClient client;
static const String _grpcHost = 'grpcb.in';
  static const int _grpcPort = 9000;


  static const ChannelOptions _channelOptions = ChannelOptions(
    credentials: ChannelCredentials.insecure(),
    idleTimeout: Duration(seconds: 30),
  );

  GrpcConfig() {
    _channel = ClientChannel(
      _grpcHost,
      port: _grpcPort,
      options: _channelOptions,
    );
    client = HelloServiceClient(_channel);
  }
}