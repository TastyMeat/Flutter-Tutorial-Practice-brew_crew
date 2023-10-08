import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/brew_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(Brew brew) async =>
      await brewCollection.doc(uid).set(brew.toJson());

  BrewUserData? _userDataFromSnapshot(DocumentSnapshot snapshot) {
    try {
      return BrewUserData(
        uid: uid,
        brew: Brew.fromJson(snapshot.data() as dynamic),
      );
    } catch (_) {
      return null;
    }
  }
  Stream<BrewUserData?> get userData =>
      brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);

  List<Brew>? _brewListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs
          .map((doc) => Brew.fromJson(doc.data() as dynamic))
          .toList();
    } catch (_) {
      return null;
    }
  }
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
