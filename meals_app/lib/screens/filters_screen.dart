import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  const FiltersScreen(this.saveFilters, this.currentFilter, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluterFree = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _gluterFree = widget.currentFilter["gluten"]!;
    _lactoseFree = widget.currentFilter["lactose"]!;
    _vegan = widget.currentFilter["vegan"]!;
    _vegetarian = widget.currentFilter["vegetarian"]!;
    super.initState();
  }

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
      appBar: AppBar(
        title: const Text("Your Filter"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  "gluten": _gluterFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
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
