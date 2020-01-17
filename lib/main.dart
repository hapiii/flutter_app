import 'package:flutter/material.dart';
import 'Tabbar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '抢分',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tabbar(),
    );

  }
}


