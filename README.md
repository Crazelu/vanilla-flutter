# vanilla

Vanilla state management in Flutter with no third party dependency and 
clean separation of concerns

## Getting Started

To get started, clone this

```git
git clone git@github.com:Crazelu/vanilla-flutter.git
```

Or

```git
git clone https://github.com/Crazelu/vanilla-flutter.git
```

Have Fun!

## ReactiveWidget

```dart
import 'package:flutter/material.dart';

class ReactiveWidget extends AnimatedWidget {
  const ReactiveWidget({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(
          key: key,
          listenable: controller,
        );

  ///A controller that the UI listens to for changes.
  final Listenable controller;

  /// Called every time the controller notifies the UI
  /// to rebuild.
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
```

## Example

```dart
class CounterController extends ChangeNotifier {
  //uncomment to user as a singleton
  // CounterController._();
  // static CounterController instance = CounterController._();

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

```dart
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
      ```
