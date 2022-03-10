import 'package:flutter/material.dart';

import '../share_preferences/preferences.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('isDarkmode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Género: ${Preferences.gender}'),
          const Divider(),
          Text('Nombre de Usuario: ${Preferences.name}'),
          const Divider(),
        ],
        
      ),
    );
  }
}
