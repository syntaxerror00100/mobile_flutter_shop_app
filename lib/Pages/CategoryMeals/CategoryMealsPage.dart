import 'package:flutter/material.dart';
import 'package:shop_app/Models/CategoryModel.dart';
import 'package:shop_app/Models/FilterModel.dart';
import 'package:shop_app/Models/MealModel.dart';
import 'package:shop_app/Pages/CategoryMeals/MealItem.dart';

import '../../dummydata.dart';

class CategoryMealPage extends StatefulWidget {
  static const route = "/category-meals";
  final FilterModel mealFilters;

  const CategoryMealPage(this.mealFilters);

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
      final mealFilters = widget.mealFilters;
      category = ModalRoute.of(context).settings.arguments;
      mealsInCategory = DUMMY_MEALS.where((x) {
        if (!x.categories.contains(category.id)) return false;

        if (x.isGlutenFree && !mealFilters.isGlutenFree) return false;
        if (x.isLactoseFree && !mealFilters.isLactoseFree) return false;
        if (x.isVegan && !mealFilters.isVegan) return false;
        if (x.isVegetarian && !mealFilters.isVegetarian) return false;

        return true;
      }).toList();
      isDataInitialized = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void deleteMealHandler(String id) {
    final removeObj = mealsInCategory.firstWhere((x) => x.id == id);
    final indexOfItem = mealsInCategory.indexOf(removeObj);
    setState(() {
      mealsInCategory.removeWhere((x) => x.id == id);
    });

    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildListItem(indexOfItem, animation);
    };

    _listKey.currentState.removeItem(indexOfItem, builder);
  }

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  Widget _buildListItem(int index, Animation animation) {
    final mealObj = mealsInCategory[index];
    return SizeTransition(
      sizeFactor: animation,
      child: MealItem(mealObj, deleteMealHandler),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Container(
          child: AnimatedList(
        key: _listKey,
        initialItemCount: mealsInCategory.length,
        itemBuilder: (ctx, index, animation) {
          return _buildListItem(index, animation);
        },
      )

          // ListView.builder(
          //   itemBuilder: (BuildContext ctx, int index) {
          //     final mealObj = mealsInCategory[index];
          //     return MealItem(mealObj, deleteMealHandler);
          //   },
          //   itemCount: mealsInCategory.length,
          // ),
          ),
    );
  }
}
