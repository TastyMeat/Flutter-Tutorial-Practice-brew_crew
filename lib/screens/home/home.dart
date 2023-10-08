import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/brew_user.dart';
import 'package:brew_crew/screens/home/brew_drawer.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 20.0),
                child: const SettingsForm(),
              ));
    }

    return StreamProvider<List<Brew>?>.value(
      initialData: const [],
      value: DatabaseService(uid: Provider.of<BrewUser>(context).uid).brews,
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          title: const Text('Brew Crew'),
          backgroundColor: Colors.brown.shade400,
          elevation: 10.0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const BrewList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showSettingsPanel,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.pink.shade400,
          child: const Icon(Icons.settings),
        ),
        drawer: BrewDrawer(),
      ),
    );
  }
}
