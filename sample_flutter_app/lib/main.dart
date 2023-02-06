import 'dart:developer';

import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

// The ShoppingListItem widget follows a common pattern for stateless widgets. It stores the values it receives in its constructor in final member variables,
// which it then uses during its build() function. For example, the inCart boolean toggles between two visual appearances: one that uses the primary color from
// the current theme, and another that uses gray.

// When the user taps the list item, the widget doesn’t modify its inCart value directly. Instead, the widget calls the onCartChanged function it received from its parent widget.
// This pattern lets you store state higher in the widget hierarchy, which causes the state to persist for longer periods of time. In the extreme, the state stored on the widget
// passed to runApp() persists for the lifetime of the application.

// When the parent receives the onCartChanged callback, the parent updates its internal state, which triggers the parent to rebuild and create a new instance of ShoppingListItem with
// the new inCart value. Although the parent creates a new instance of ShoppingListItem when it rebuilds, that operation is cheap because the framework compares the newly built widgets
// with the previously built widgets and applies only the differences to the underlying RenderObject.

// The ShoppingList class extends StatefulWidget, which means this widget stores mutable state. When the ShoppingList widget is first inserted into the tree, the framework calls the createState()
// function to create a fresh instance of _ShoppingListState to associate with that location in the tree. (Notice that subclasses of State are typically named with leading underscores to indicate
// that they are private implementation details.) When this widget’s parent rebuilds, the parent creates a new instance of ShoppingList, but the framework reuses the _ShoppingListState instance that
// is already in the tree rather than calling createState again.

// To access properties of the current ShoppingList, the _ShoppingListState can use its widget property. If the parent rebuilds and creates a new ShoppingList, the _ShoppingListState rebuilds with the
// new widget value. If you wish to be notified when the widget property changes, override the didUpdateWidget() function, which is passed an oldWidget to let you compare the old widget with the current
// widget.

// When handling the onCartChanged callback, the _ShoppingListState mutates its internal state by either adding or removing a product from _shoppingCart. To signal to the framework that it changed its
// internal state, it wraps those calls in a setState() call. Calling setState marks this widget as dirty and schedules it to be rebuilt the next time your app needs to update the screen. If you forget
// to call setState when modifying the internal state of a widget, the framework won’t know your widget is dirty and might not call the widget’s build() function, which means the user interface might not
// update to reflect the changed state. By managing state in this way, you don’t need to write separate code for creating and updating child widgets. Instead, you simply implement the build function,
// which handles both situations.
class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.
    return inCart //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need
      // to change _shoppingCart inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: [
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}