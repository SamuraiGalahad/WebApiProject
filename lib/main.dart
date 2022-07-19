// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 56, 69, 91)),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Duhast'),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_time_rounded),
                label: Text('Нажми'))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('AAAAAA');
            },
            child: Text('Press')),
        backgroundColor: Colors.white,
      ),
    );
  }
}
