import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/brew.dart';
import '/models/brew_user.dart';
import '/services/database.dart';
import '/shared/constants.dart';
import '/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugarOptions = ['0', '1', '2', '3', '4'];

  Brew? _brew;

  @override
  Widget build(BuildContext context) => StreamBuilder<BrewUserData?>(
      stream: DatabaseService(uid: Provider.of<BrewUser>(context).uid).userData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        }

        BrewUserData brewUserData = snapshot.data!;
        Brew brew = _brew ?? brewUserData.brew.copyWith();

        return Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Update your brew settings.',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                initialValue: brew.name,
                decoration: textInputDecoration,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                onChanged: (value) =>
                    setState(() => _brew = brew.copyWith(name: value)),
              ),
              const SizedBox(height: 20.0),
              Slider(
                value: brew.strength.toDouble(),
                min: 100.0,
                max: 900.0,
                divisions: 8,
                activeColor: Colors.brown[brew.strength],
                inactiveColor: Colors.brown[brew.strength],
                onChanged: (value) => setState(
                    () => _brew = brew.copyWith(strength: value.toInt())),
              ),
              DropdownButtonFormField(
                value: brew.sugarCount,
                decoration: textInputDecoration,
                items: sugarOptions
                    .map((sugarCount) => DropdownMenuItem(
                          value: sugarCount,
                          child: Text('$sugarCount sugar(s)'),
                        ))
                    .toList(),
                onChanged: (value) => setState(
                    () => _brew = brew.copyWith(sugarCount: value ?? '0')),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade400),
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await DatabaseService(uid: brewUserData.uid)
                        .updateUserData(brew);
                    if (mounted) Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        );
      });
}
