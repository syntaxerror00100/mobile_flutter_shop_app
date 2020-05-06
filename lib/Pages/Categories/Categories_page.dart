import 'package:flutter/material.dart';
import 'package:shop_app/Models/CategoryModel.dart';
import '../../dummydata.dart';
import './CategoryItem.dart';

class CategoryItemPage extends StatelessWidget {
  static const barTitle = "Categories";
  final List<CategoryModel> categories = DATA_DUMMY_CATEGORIES;

  List<Widget> buildCategoryItems() {
    return categories.map((item) => CategoryItem(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView(
        children: buildCategoryItems(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
