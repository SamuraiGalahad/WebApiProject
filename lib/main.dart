// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Duhast'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Duhast Vyacheslavovich',
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontFamily: 'Roboto'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('AAAAAA');
            },
            child: Text('Press')),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
