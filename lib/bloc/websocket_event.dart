import 'package:equatable/equatable.dart';

abstract class WebSocketEvent extends Equatable {
  const WebSocketEvent();
}

class SendMessage extends WebSocketEvent {
  final String message;

  const SendMessage(this.message);

  @override
  List<Object> get props => [message];
}

class WebSocketReceived extends WebSocketEvent {
  final String data;
  const WebSocketReceived(this.data);

  @override
  List<Object> get props => [data];
}

class WebSocketConnectingEvent extends WebSocketEvent {

  const WebSocketConnectingEvent();

  @override
  List<Object> get props => [];
}

class WebSocketErrorEvent extends WebSocketEvent {

  const WebSocketErrorEvent();

  @override
  List<Object> get props => [];
}