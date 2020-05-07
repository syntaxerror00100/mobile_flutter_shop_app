import 'package:flutter/material.dart';
import 'package:shop_app/Models/FilterModel.dart';
import '../MainDrawer.dart';

class FilterPage extends StatefulWidget {
  static const route = 'filter-page';

  final Function saveFilterHandler;
  final FilterModel filterInitialValue;

  const FilterPage(this.saveFilterHandler, this.filterInitialValue);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FilterModel filterModel;
  @override
  void initState() {
    filterModel = widget.filterInitialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              widget.saveFilterHandler(filterModel);
            },
            child: Icon(Icons.save),
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: <Widget>[
          _buildSwitchListTile(filterModel.isGlutenFree, 'Is gluten free',
              'Enable to show gluten free', (val) {
            setState(() {
              filterModel.isGlutenFree = val;
            });
          }),
          _buildSwitchListTile(filterModel.isLactoseFree, 'Is lactose free',
              'Enable to show caltose free', (val) {
            setState(() {
              filterModel.isLactoseFree = val;
            });
          }),
          _buildSwitchListTile(
              filterModel.isVegan, 'Is vegan', 'Enable to show vegan foods',
              (val) {
            setState(() {
              filterModel.isVegan = val;
            });
          }),
          _buildSwitchListTile(filterModel.isVegetarian, 'Is vegetarian',
              'Enable to show vegetarian foods', (val) {
            setState(() {
              filterModel.isVegetarian = val;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(
      bool value, String title, String subTitle, Function onChange) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: onChange,
    );
  }
}
