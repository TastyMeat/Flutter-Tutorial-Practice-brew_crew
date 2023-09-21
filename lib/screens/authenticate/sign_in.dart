import 'package:brew_crew/services/auth_service.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  String _email = '', _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) => _loading
      ? const Loading()
      : Scaffold(
          backgroundColor: Colors.brown.shade100,
          appBar: AppBar(
            backgroundColor: Colors.brown.shade400,
            elevation: 10.0,
            title: const Text('Sign in to Brew Crew'),
            actions: [
              TextButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('Register'),
                  onPressed: () => widget.toggleView()),
            ],
          ),
          body: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an email' : null,
                    onChanged: (value) => setState(() => _email = value),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: "Password"),
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? 'Enter a password 6+ characters long'
                        : null,
                    onChanged: (value) => setState(() => _password = value),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: const Text('Sign In',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _loading = true);
                        dynamic result = await _authService
                            .signIn_EmailAndPassword(_email, _password);
                        if (result == null) {
                          setState(() {
                            _error = 'Could not sign in with those credentials';
                            _loading = false;
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    _error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        );
}
