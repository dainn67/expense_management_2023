import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"), // User's name
            accountEmail: Text("johndoe@example.com"), // User's email
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 48.0,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue, // Header background color
            ),
          ),
          ListTile(
            title: const Text('Setting'),
            onTap: () {
              // Handle item 1 click
            },
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {
              // Handle item 1 click
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Log out'),
            onTap: () {
              // Handle item 2 click
            },
          ),
        ],
      ),
    );
  }
}
