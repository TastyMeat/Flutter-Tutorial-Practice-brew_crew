import 'package:brew_crew/models/brew_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

class BrewDrawer extends StatefulWidget {
  BrewDrawer({super.key});
  final AuthService _authService = AuthService();
  @override
  State<BrewDrawer> createState() => _BrewDrawerState();
}

class _BrewDrawerState extends State<BrewDrawer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BrewUserData?>(
      stream: DatabaseService(uid: Provider.of<BrewUser>(context).uid).userData,
      builder: (context, snapshot) => Drawer(
        width: 180,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.brown.shade400),
              currentAccountPicture: CircleAvatar(
                foregroundImage: const AssetImage('assets/coffee_icon.png'),
                backgroundColor:
                    Colors.brown[snapshot.data?.brew.strength ?? 100],
              ),
              accountName: Text(snapshot.data?.brew.name ?? 'Unknown User'),
              accountEmail: null,
            ),
            const Spacer(),
            ListTile(
              onTap: () async => await widget._authService.signOut(),
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              iconColor: Colors.pink.shade400,
            ),
            //style: TextButton.styleFrom(foregroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
