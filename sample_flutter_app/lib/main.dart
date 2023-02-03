import 'package:flutter/material.dart';

// Flutter provides a number of widgets that help you build apps that follow Material Design. A Material app starts with the MaterialApp widget,
// which builds a number of useful widgets at the root of your app, including a Navigator, which manages a stack of widgets identified by strings,
// also known as “routes”. The Navigator lets you transition smoothly between screens of your application.
// Using the MaterialApp widget is entirely optional but a good practice.

// Now that the code has switched from MyAppBar and MyScaffold to the AppBar and Scaffold widgets, and from material.dart, the app is starting to look a bit more Material.
// For example, the app bar has a shadow and the title text inherits the correct styling automatically. A floating action button is also added.
// Notice that widgets are passed as arguments to other widgets. The Scaffold widget takes a number of different widgets as named arguments, each of which are placed in the
// Scaffold layout in the appropriate place. Similarly, the AppBar widget lets you pass in widgets for the leading widget, and the actions of the title widget. This pattern
// recurs throughout the framework and is something you might consider when designing your own widgets.
void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: const Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}