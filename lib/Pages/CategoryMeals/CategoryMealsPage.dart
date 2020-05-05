import 'package:flutter/material.dart';
import 'package:shop_app/Models/CategoryModel.dart';
import 'package:shop_app/Models/MealModel.dart';
import 'package:shop_app/Pages/CategoryMeals/MealItem.dart';

import '../../dummydata.dart';

class CategoryMealPage extends StatelessWidget {
  static const route = "/category-meals";

  @override
  Widget build(BuildContext context) {
    CategoryModel category = ModalRoute.of(context).settings.arguments;

    List<MealModel> mealsInCategory =
        DUMMY_MEALS.where((x) => x.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int index) {
            final mealObj = mealsInCategory[index];
            return MealItem(mealObj);
          },
          itemCount: mealsInCategory.length,
        ),
      ),
    );
  }
}
