import 'dart:ui';

import 'package:flutter/material.dart';
import './Pages/MealDetails/MealDetailsPage.dart';
import './Pages/CategoryMeals/CategoryMealsPage.dart';
import './Pages/TabsPage.dart';

// iTS JUST A COMMENT
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets start a meal',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/",
      routes: {
        "/": (ctx) =>
            TabsMainPage(), // MyHomePage(title: 'Flutter Demo Home Page'),
        MealDetailsPage.route: (ctx) => new MealDetailsPage(),
        CategoryMealPage.route: (ctx) => new CategoryMealPage()
      },
    );
  }
}
