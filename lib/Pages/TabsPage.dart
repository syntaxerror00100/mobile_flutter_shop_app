import 'package:flutter/material.dart';

import './Categories/Categories_page.dart';
import './Favorites/Favorites.dart';
import '../Pages/MainDrawer.dart';

class TabsMainPage extends StatefulWidget {
  @override
  _TabsMainPageState createState() => _TabsMainPageState();
}

class _TabsMainPageState extends State<TabsMainPage> {
  final List<Map<String, Object>> pages = [
    {'Page': CategoryItemPage(), 'Title': CategoryItemPage.barTitle},
    {'Page': FavoritesPage(), 'Title': FavoritesPage.barTitle}
  ];

  int currentSelectedIndex = 0;

  void setSelectedIndexHandler(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedPage = pages[currentSelectedIndex];
    final selectedPageTitle = selectedPage['Title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPageTitle),
      ),
      body: selectedPage['Page'],
      drawer: Drawer(child: MainDrawer()),
      bottomNavigationBar: BottomNavigationBar(
          onTap: setSelectedIndexHandler,
          currentIndex: currentSelectedIndex,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favorites'))
          ]),
    );
  }
}
