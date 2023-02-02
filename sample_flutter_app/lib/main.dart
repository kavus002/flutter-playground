import 'package:flutter/material.dart';

void main() {
  runApp(
    // Makes the Center widget the root of the widget tree. The widget tree consists of two widgets,
    // the Center widget and its child, the Text widget. The framework forces the root widget to cover
    // the screen, which means the text “Hello, world” ends up centered on screen. The text direction needs
    // to be specified in this instance; when the MaterialApp widget is used, this is taken care of for you,
    // as demonstrated later.

    // When writing an app, you’ll commonly author new widgets that are subclasses of either StatelessWidget or StatefulWidget,
    // depending on whether your widget manages any state. A widget’s main job is to implement a build() function, which describes
    // the widget in terms of other, lower-level widgets. The framework builds those widgets in turn until the process bottoms out in
    // widgets that represent the underlying RenderObject, which computes and describes the geometry of the widget.
    const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}