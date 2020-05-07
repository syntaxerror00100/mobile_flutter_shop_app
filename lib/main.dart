import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/Models/FilterModel.dart';
import './Pages/MealDetails/MealDetailsPage.dart';
import './Pages/CategoryMeals/CategoryMealsPage.dart';
import './Pages/TabsPage.dart';
import './Pages/Filters/FilterPage.dart';

// iTS JUST A COMMENT
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var mealFilter = new FilterModel(true, true, true, true);

  void updateFilterHandler(FilterModel filterModel) {
    print(filterModel);
    setState(() {
      mealFilter = filterModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(mealFilter);
    return MaterialApp(
      title: 'Lets start a meal',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/",
      routes: {
        "/": (ctx) =>
            TabsMainPage(), // MyHomePage(title: 'Flutter Demo Home Page'),
        MealDetailsPage.route: (ctx) => new MealDetailsPage(),
        CategoryMealPage.route: (ctx) => new CategoryMealPage(mealFilter),
        FilterPage.route: (ctx) =>
            new FilterPage(updateFilterHandler, mealFilter)
      },
    );
  }
}
