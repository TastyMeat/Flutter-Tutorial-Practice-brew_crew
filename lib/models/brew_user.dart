import 'package:brew_crew/models/brew.dart';

class BrewUser {
  final String uid;
  BrewUser({required this.uid});
}

class BrewUserData{
  final String uid;
  final Brew brew;

  BrewUserData({required this.uid, required this.brew});
}