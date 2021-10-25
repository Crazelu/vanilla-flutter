import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  //uncomment to use as a singleton
  // CounterController._();
  // static CounterController instance = CounterController._();

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
