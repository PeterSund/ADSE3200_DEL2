import 'package:adse3200/design/app_theme.dart';
import 'package:adse3200/homepage.dart';
import 'package:adse3200/pizza_maker.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key? key}) : super(key: key);

  final List<ListTile> lists = [
    const ListTile(
      title: Text('Stor eksempelpizza'),
      subtitle: Text('Rød saus, kylling, parmesan, oliven,'),
      trailing: Text('249,-'),
    ),
    const ListTile(
      title: Text('Liten eksempelpizza'),
      subtitle: Text('Hvit saus, mozerella, aubergine'),
      trailing: Text('149,-'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BACKGROUND_COLOR_APPBAR,
          leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: const Text("Handlevogn", style: TextStyle(color: Colors.black),),
        ),
        body: Column(children: [
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: lists.length,
                itemBuilder: (context, index) {
                  return lists[index];
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text("Totalsum: 398 kr", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Container(margin: const EdgeInsets.only(top: 20),
            height: 50,
            width: 230, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: ACCENT_COLOR),
            onPressed: () {
              var snackbar = const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Bestilling sendt"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            child: Text("Send bestilling"),
          ),
        ),]));
  }
}
