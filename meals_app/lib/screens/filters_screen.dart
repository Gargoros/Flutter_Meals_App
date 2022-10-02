import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = 'filters';

  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filter")),
      drawer: const MainDraw(),
      body: const Center(
        child: Text("Filters!"),
      ),
    );
  }
}
