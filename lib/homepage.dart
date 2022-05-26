import 'package:adse3200/pizza_maker.dart';
import 'package:adse3200/topbar.dart';
import 'package:flutter/material.dart';

import 'drawer_menu.dart';
import 'shopping_cart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(),
      drawer: DrawerMenu(),
      endDrawer: ShoppingCart(),
      body: PizzaMaker(),
    );
  }
}
