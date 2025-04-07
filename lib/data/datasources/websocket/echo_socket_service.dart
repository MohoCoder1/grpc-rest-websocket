

import 'dart:async';
import 'dart:io';

class EchoSocketService {
  final String _url = 'wss://echo.websocket.events';
  WebSocket? _socket;
final _controller = StreamController<String>.broadcast();

Stream<String> get messages => _controller.stream;


  Future<void> connect() async{
    _socket = await WebSocket.connect(_url);
    _socket!.listen((event){
      _controller.add(event);
    });
  }

  void sendMessage(String message) {
    if (_socket != null && _socket!.readyState == WebSocket.open) {
      _socket!.add(message);
    } else {
      print('Socket is not connected');
    }
  }

  void disconnect() {
    if (_socket != null) {
      _socket!.close();
      _socket = null;
    }
  }
}