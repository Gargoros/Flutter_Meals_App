import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDraw extends StatelessWidget {
  const MainDraw({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).colorScheme.secondary,
        child: Text(
          'Cooking Up!',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      buildListTile("Meals", Icons.restaurant, () {
        Navigator.of(context).pushReplacementNamed('');
      }),
      buildListTile("Filters", Icons.settings, () {
        Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
      }),
    ]));
  }
}
