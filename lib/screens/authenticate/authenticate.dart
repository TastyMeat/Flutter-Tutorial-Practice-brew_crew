import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool _showSignIn = true;

  @override
  Widget build(BuildContext context) => _showSignIn
      ? SignIn(toggleView: () => setState(() => _showSignIn = false))
      : Register(toggleView: () => setState(() => _showSignIn = true));
}
