import 'package:chat_app/components/list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer(
      {super.key, required this.onProfileTap, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              // Header
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  size: 70,
                ),
              ),
              // Home
              ListTilePage(
                icon: Icons.home,
                text: "H o m e",
                onTap: () => Navigator.pop(context),
              ),
              // Profile
              ListTilePage(
                  icon: Icons.person, text: "P e r s o n", onTap: onProfileTap),
            ],
          ),
          // logout
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListTilePage(
                icon: Icons.logout, text: "L o g o u t", onTap: onSignOut),
          )
        ],
      ),
    );
  }
}
