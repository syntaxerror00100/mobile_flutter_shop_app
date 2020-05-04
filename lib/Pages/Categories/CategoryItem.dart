import 'package:flutter/material.dart';
import '../../Models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.title,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
