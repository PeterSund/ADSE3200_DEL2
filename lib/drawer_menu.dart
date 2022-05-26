import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Meny',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2),
            title: Text('Ordrehistorikk'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profil'),
          ),
        ],
      ),
    );
  }
}
