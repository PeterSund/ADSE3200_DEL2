import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key? key}) : super(key: key);

  final   List<ListTile> lists = [
    const ListTile(
      leading: Text('Tile Leading 1'),
      title: Text('Tile Title 1'),
      subtitle: Text('Tile Subtitle 1'),
      trailing: Text('Tile Trailing 1'),
    ),
    const ListTile(
      leading: Text('Tile Leading 2'),
      title: Text('Tile Title 2'),
      subtitle: Text('Tile Subtitle 2'),
      trailing: Text('Tile Trailing 2'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: const Text("Handlevogn"),
        ),
        body: Container(
          height: 200,
          child: ListView.builder(
              itemCount: lists.length,
              itemBuilder: (context, index) {
                return lists[index];
              }),
        )
        );
  }
}
