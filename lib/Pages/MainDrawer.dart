import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext ctx, IconData icon, String label) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        'Meals',
        style: TextStyle(
          fontFamily: label,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
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
        buildListTile(context, Icons.restaurant, 'Meals'),
        buildListTile(context, Icons.settings, 'Filters')
      ],
    );
  }
}
