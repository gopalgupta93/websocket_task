
import 'package:web_socket_channel/io.dart';

class WebSocketService {
  final channel = IOWebSocketChannel.connect('wss://stream.binance.com:9443/ws/btcusdt@trade');

  void sendMessage(String message) {
    channel.sink.add(message);
  }

  Stream get stream => channel.stream;

  void dispose() {
    channel.sink.close();
  }
}