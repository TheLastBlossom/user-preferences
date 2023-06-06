import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            _DrawerHeader(),                        
            ItemMenu(itemName: 'Home',routeName: HomeScreen.routerName, icon: Icons.home_outlined),
            ItemMenu(itemName: 'People',routeName: HomeScreen.routerName, icon: Icons.people_alt_outlined),
            ItemMenu(itemName: 'Settings',routeName: SettingsScreen.routerName, icon: Icons.settings_outlined),
          ],
        ),
      ),
    ); 
  }
}

class ItemMenu extends StatelessWidget {
  final String routeName;
  final String itemName;
  final IconData icon;
  const ItemMenu({
    super.key, required this.routeName, required this.itemName, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(itemName),
      onTap: () {                
        Navigator.pushReplacementNamed(context, routeName);
      },
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'),
              fit: BoxFit.cover)),                      
      child: Container(),
    );
  }
}
