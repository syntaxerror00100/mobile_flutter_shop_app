import 'package:flutter/material.dart';
import './Filters/FilterPage.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext ctx, IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: label,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          height: 150,
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          child: Text(
            'Lets cook!',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        buildListTile(context, Icons.restaurant, 'Meals', () {
          Navigator.pushReplacementNamed(context, '/');
        }),
        buildListTile(context, Icons.settings, 'Filters', () {
          Navigator.pushReplacementNamed(context, FilterPage.route);
        })
      ],
    );
  }
}
