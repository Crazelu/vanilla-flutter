import 'package:flutter/material.dart';
import 'package:vanilla/reactive_widget.dart';
import 'package:vanilla/views/home/controller/counter_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
    required this.title,
    required this.counterController,
  }) : super(key: key);

  final String title;
  final CounterController counterController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ReactiveWidget(
              controller: counterController,
              builder: (_) {
                return Text(
                  '${counterController.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
