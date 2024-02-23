import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytask/bloc/websocket_event.dart';
import 'package:mytask/bloc/websocket_state.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../websocket_service.dart';




class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  final WebSocketService webSocketService = WebSocketService();

  WebSocketBloc(super.initialState);

  @override
  WebSocketState get initialState => WebSocketInitial();

  @override
  Stream<WebSocketState> mapEventToState(
      WebSocketEvent event,
      ) async* {


    if (event is SendMessage) {
      webSocketService.sendMessage(event.message);
    }else if(event is WebSocketConnectingEvent){
print("WebSocketConnetingEvent");
webSocketService.stream.listen((data) {
print(data);
add(WebSocketReceived(data));
 },onError: (e){ print("myerror");
  WebSocketErrorEvent();}, );
    } else if (event is WebSocketReceived) {
      yield WebSocketDataReceived(event.data);
    }else if (event is WebSocketErrorEvent) {
      yield WebSocketError();
    }
  }

  @override
  Future<void> close() {
    webSocketService.dispose();
    return super.close();
  }
}