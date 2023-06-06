import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Scaffold(             
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenuScreen(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Text('isDartmode: ${Preferences.isDarkMode}'),
          Divider(),
          Text('Género: ${Preferences.gender}'),
          Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          Divider()
        ],
      ),
    );
  }
}
