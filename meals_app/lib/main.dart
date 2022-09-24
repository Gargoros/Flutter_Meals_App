import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          //secondary: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      home: CategoriesScreen(),
      initialRoute: '', // default is '/'
      routes: {
        '': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onGenerateInitialRoutes: (setting) {
      //   print(setting.arguments as String);
      // },
      // onUnknownRoute: ((settings) {
      //   return MaterialPageRoute(builder: ((context) => CategoriesScreen(),);
      // },
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("DeliMeals"),
    ),
    body: Center(
      child: Text("Navigation Time!"),
    ),
  );
}
