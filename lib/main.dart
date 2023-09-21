import 'package:brew_crew/models/brew_user.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => StreamProvider<BrewUser?>.value(
        initialData: null,
        value: AuthService().user,
        child: const MaterialApp(
          home: Wrapper(),
        ),
      );
}
