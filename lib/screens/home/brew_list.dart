import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/brew_user.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context) ?? [];

    return StreamBuilder<BrewUserData?>(
        stream:
            DatabaseService(uid: Provider.of<BrewUser>(context).uid).userData,
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0, left: 20),
                  child: Text(
                    'My Brew:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: snapshot.hasData
                    ? BrewTile(brew: snapshot.data!.brew)
                    : null,
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0, left: 20),
                  child: Text(
                    'Other Brews:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverList.builder(
                  itemCount: brews.length,
                  itemBuilder: (context, index) =>
                      snapshot.hasData && snapshot.data!.brew != brews[index]
                          ? BrewTile(brew: brews[index])
                          : const SizedBox.shrink()),
            ],
          );
        });
  }
}
