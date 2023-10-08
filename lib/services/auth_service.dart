import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/brew_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  BrewUser? _brewUserFromFirebaseUser(User? user) =>
      user == null ? null : BrewUser(uid: user.uid);

  Stream<BrewUser?> get user =>
      _firebaseAuth.authStateChanges().map(_brewUserFromFirebaseUser);

  // ignore: non_constant_identifier_names
  Future signIn_Anonymous() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User? user = userCredential.user;
      return _brewUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  Future register_EmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      await DatabaseService(uid: user!.uid).updateUserData(Brew());
      return _brewUserFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  Future signIn_EmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _brewUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
