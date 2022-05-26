import 'package:adse3200/shopping_cart.dart';
import 'package:flutter/material.dart';

class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  AppBarTop({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  final list = List<int>.filled(5, 0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Pizza"),
      actions: <Widget>[
      //https://stackoverflow.com/questions/51019291/how-can-i-add-item-number-on-the-cart-icon-at-at-appbar-icon-in-flutter-and-how
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>  ShoppingCart()));
              },
              child: Stack(
                children: <Widget>[
                  const IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  list.isEmpty
                      ? Container()
                      : Positioned(
                          child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.green[800]),
                            Positioned(
                                top: 3.0,
                                right: 4.0,
                                child: Center(
                                  child: Text(
                                    list.length.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                ],
              ),
            )),
      )
    ]);
  }
}
