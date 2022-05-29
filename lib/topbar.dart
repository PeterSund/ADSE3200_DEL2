import 'package:adse3200/design/app_theme.dart';
import 'package:adse3200/shopping_cart.dart';
import 'package:flutter/material.dart';

class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  AppBarTop({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  final list = List<int>.filled(2, 0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: BACKGROUND_COLOR_APPBAR,
      title: const Text("Pizzamaker 🍕", style: TextStyle(color: Colors.black, fontSize: 20)), 
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
                      color: Colors.black,
                    ),
                    onPressed: null,
                  ),
                  list.isEmpty
                      ? Container()
                      : Positioned(
                          child: Stack(
                          children: <Widget>[
                            Icon(Icons.brightness_1,
                                size: 20.0, color: ACCENT_COLOR),
                            Positioned(
                                top: 4.5,
                                right: 6.0,
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
