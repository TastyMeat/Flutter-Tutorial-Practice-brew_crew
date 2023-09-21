import 'package:brew_crew/models/brew_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugarOptions = ['0', '1', '2', '3', '4'];

  String? _currentName;
  int? _currentStrength;
  String? _currentSugarCount;

  @override
  Widget build(BuildContext context) => StreamBuilder<BrewUserData>(
      stream: DatabaseService(uid: Provider.of<BrewUser>(context).uid).userData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        }

        BrewUserData? brewUserData = snapshot.data;
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
                initialValue: brewUserData!.brew.name,
                decoration: textInputDecoration,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                onChanged: (value) => setState(() => _currentName = value),
              ),
              const SizedBox(height: 20.0),
              Slider(
                value:
                    (_currentStrength ?? brewUserData.brew.strength).toDouble(),
                min: 100.0,
                max: 900.0,
                divisions: 8,
                activeColor: Colors.brown[_currentStrength ?? 100],
                inactiveColor: Colors.brown[_currentStrength ?? 100],
                onChanged: (value) =>
                    setState(() => _currentStrength = value.round()),
              ),
              DropdownButtonFormField(
                value: _currentSugarCount ?? brewUserData.brew.sugarCount,
                decoration: textInputDecoration,
                items: sugarOptions
                    .map((sugarCount) => DropdownMenuItem(
                          value: sugarCount,
                          child: Text('$sugarCount sugar(s)'),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _currentSugarCount = value),
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
                    await DatabaseService(uid: brewUserData.uid).updateUserData(
                      _currentName ?? brewUserData.brew.name,
                      _currentSugarCount ?? brewUserData.brew.sugarCount,
                      _currentStrength ?? brewUserData.brew.strength,
                    );
                    if (mounted) Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        );
      });
}
