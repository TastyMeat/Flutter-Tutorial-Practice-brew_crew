import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/brew_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, String sugarCount, int strength) async =>
      await brewCollection.doc(uid).set({
        'name': name,
        'strength': strength,
        'sugarCount': sugarCount,
      });

  BrewUserData _userDataFromSnapshot(DocumentSnapshot snapshot) => BrewUserData(
      uid: uid,
      brew: Brew(
        name: snapshot.get('name'),
        strength: snapshot.get('strength'),
        sugarCount: snapshot.get('sugarCount'),
      ));

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) => snapshot.docs
      .map((doc) => Brew(
            name: doc.get('name'),
            strength: doc.get('strength'),
            sugarCount: doc.get('sugarCount'),
          ))
      .toList();

  Stream<BrewUserData> get userData =>
      brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);

  Stream<List<Brew>> get brews =>
      brewCollection.snapshots().map(_brewListFromSnapshot);
}
