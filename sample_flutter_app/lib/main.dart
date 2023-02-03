import 'dart:developer';

import 'package:flutter/material.dart';

// So far, this page has used only stateless widgets. Stateless widgets receive arguments from their parent widget,
// which they store in final member variables. When a widget is asked to build(), it uses these stored values to derive
// new arguments for the widgets it creates.
//
// In order to build more complex experiences—for example, to react in more interesting ways to user input—applications
// typically carry some state. Flutter uses StatefulWidgets to capture this idea. StatefulWidgets are special widgets that
// know how to generate State objects, which are then used to hold state.
//
// You might wonder why StatefulWidget and State are separate objects. In Flutter, these two types of objects have different
// life cycles. Widgets are temporary objects, used to construct a presentation of the application in its current state. State objects,
// on the other hand, are persistent between calls to build(), allowing them to remember information.
class Counter extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".

  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework
      // that something has changed in this State, which
      // causes it to rerun the build method below so that
      // the display can reflect the updated values. If you
      // change _counter without calling setState(), then
      // the build method won't be called again, and so
      // nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance, as done by the _increment method above.
    // The Flutter framework has been optimized to make
    // rerunning build methods fast, so that you can just
    // rebuild anything that needs updating rather than
    // having to individually changes instances of widgets.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}