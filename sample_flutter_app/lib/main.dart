import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyButton(),
        ),
      ),
    ),
  );
}

// The GestureDetector widget doesn’t have a visual representation but instead detects gestures made by the user. When the user taps the Container,
// the GestureDetector calls its onTap() callback, in this case printing a message to the console. You can use GestureDetector to detect a variety
// of input gestures, including taps, drags, and scales.
//
// Many widgets use a GestureDetector to provide optional callbacks for other widgets. For example, the IconButton, ElevatedButton, and FloatingActionButton
// widgets have onPressed() callbacks that are triggered when the user taps the widget.
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('MyButton was tapped!');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Clickety Click on me to Engage'),
        ),
      ),
    );
  }
}