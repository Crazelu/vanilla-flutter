import 'package:flutter/material.dart';
import 'package:vanilla/views/home/controller/counter_controller.dart';
import 'package:vanilla/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(
        title: 'Flutter Demo Home Page',
        counterController: CounterController(),
      ),
    );
  }
}
