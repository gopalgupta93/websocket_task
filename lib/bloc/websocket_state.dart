import 'package:equatable/equatable.dart';

abstract class WebSocketState extends Equatable {
  const WebSocketState();
}

class WebSocketInitial extends WebSocketState {
  @override
  List<Object> get props => [];
}

class WebSocketConnected extends WebSocketState {
  @override
  List<Object> get props => [];
}
class WebSocketDisconnected extends WebSocketState {
  @override
  List<Object> get props => [];
}
class WebSocketError extends WebSocketState {
  @override
  List<Object> get props => [];
}

class WebSocketDataReceived extends WebSocketState {
  final String data;

  const WebSocketDataReceived(this.data);

  @override
  List<Object> get props => [data];
}