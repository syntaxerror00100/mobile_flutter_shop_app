import 'package:flutter/material.dart';
import 'package:shop_app/Models/CategoryModel.dart';
import 'package:shop_app/Models/MealModel.dart';
import 'package:shop_app/Pages/CategoryMeals/MealItem.dart';

import '../../dummydata.dart';

class CategoryMealPage extends StatefulWidget {
  static const route = "/category-meals";

  @override
  _CategoryMealPageState createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  List<MealModel> mealsInCategory;
  CategoryModel category;

  bool isDataInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isDataInitialized) {
      category = ModalRoute.of(context).settings.arguments;
      mealsInCategory =
          DUMMY_MEALS.where((x) => x.categories.contains(category.id)).toList();
      isDataInitialized = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void deleteMealHandler(String id) {
    setState(() {
      mealsInCategory.removeWhere((x) => x.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int index) {
            final mealObj = mealsInCategory[index];
            return MealItem(mealObj, deleteMealHandler);
          },
          itemCount: mealsInCategory.length,
        ),
      ),
    );
  }
}
