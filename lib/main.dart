import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/websocket_bloc.dart';
import 'bloc/websocket_event.dart';
import 'bloc/websocket_state.dart';
import 'model/crypto_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WebSocketBloc(WebSocketInitial())..add(WebSocketConnectingEvent()),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Task'),
      ),
      body: BlocBuilder<WebSocketBloc, WebSocketState>(
        builder: (context, state) {
          if (state is WebSocketDataReceived) {

            var dataMap=  Map.from(jsonDecode(state.data));


            return
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: dataMap.map((key, value) =>MapEntry(key,  RowItem(dataKey: key, value: value.toString()))).values.toList(),
                ),
              );

              Text('Received: ${state.data}');
          }
          else if(state is WebSocketError){
return Text("Websocket error");
          }

          else {
            return Text('Waiting for data...');
          }
        },
      ),

    );
  }
}

class RowItem extends StatelessWidget{
 final String dataKey;
final  String value;

  const RowItem({ required this.dataKey, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(
          dataKey, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
          Text(
            value, style: TextStyle(fontSize: 14, ),

          )
        ],

      ),
    );

  }

}

//  BlocProvider.of<WebSocketBloc>(context)
//               .add(SendMessage('Hello WebSocket!'));