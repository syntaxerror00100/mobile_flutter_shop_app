import 'package:flutter/material.dart';
import '../../dummydata.dart';

class MealDetailsPage extends StatelessWidget {
  static const route = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealObj = DUMMY_MEALS.firstWhere((x) => x.id == mealId);

    return Scaffold(
        appBar: AppBar(
          title: Text(mealObj.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Hero(tag: mealObj.id, child: Image.network(mealObj.imageUrl)),
              Text(mealObj.title),
            ],
          ),
        ));
  }
}
