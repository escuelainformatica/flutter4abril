import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

// es una widget sin estado.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool habilitado=true;

  Stream<DateTime> ejemploStream() async* {
    while(true) {
      await Future.delayed(Duration(seconds: 2));
      var ahora = DateTime.now();
      if(habilitado) {
        yield ahora; // devuelve un valor y sigue trabajando
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: ejemploStream.call(),
            builder:  (BuildContext context, AsyncSnapshot<DateTime> snapshot) {
              return Text(snapshot.data.toString(),
                  textAlign: TextAlign.left,
                  style:const TextStyle(
                      color:Colors.white,
                      backgroundColor:Colors.blue
                  )
              );
            },

          ),
          ElevatedButton(
            onPressed: (){
              setState(() {habilitado=!habilitado;});
                  },
            child:Text(" boton")
          )


        ],
      )
    );
  }
}
