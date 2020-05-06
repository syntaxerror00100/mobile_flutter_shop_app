import 'package:flutter/material.dart';
import '../MainDrawer.dart';

class FilterPage extends StatelessWidget {
  static const route = 'filter-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Text('Filter'),
    );
  }
}
