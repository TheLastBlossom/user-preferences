import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenuScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ajustes',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
            ),
            const Divider(),
            SwitchListTile(
              value: Preferences.isDarkMode,
              title: const Text('Dartmode'),
              onChanged: (value) {
                Preferences.isDarkMode = value;
                final themeProvider = Provider.of<ThemeProvider>(context,listen:false);
                value ? themeProvider.setDarKMode() : themeProvider.setLightMode();
                setState(() {});
              },
            ),
            const Divider(),
            RadioListTile<int>(
              value: 1,
              title: const Text('Man'),
              groupValue: Preferences.gender,
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? 1;
                });
              },
            ),
            const Divider(),
            RadioListTile<int>(
              value: 2,
              title: const Text('Women'),
              groupValue: Preferences.gender,
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? 2;
                });
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  setState(() {
                    Preferences.name = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Name', helperText: "User's Name"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
