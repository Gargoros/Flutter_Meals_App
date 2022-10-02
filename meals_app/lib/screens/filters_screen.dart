import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluterFree = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filter")),
      drawer: const MainDraw(),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text("Adjust you meal selection.",
                  style: Theme.of(context).textTheme.titleMedium)),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile(
                  "Gluten-free", "Only include gluten-free maels", _gluterFree,
                  (newValue) {
                setState(() {
                  _gluterFree = newValue;
                });
              }),
              _buildSwitchTile("Lactose-free",
                  "Only include lactose-free maels", _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchTile(
                  "Vegetarian", "Only include vegetarian maels", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchTile("Vegan", "Only include vegan meals", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
