import 'package:flutter/material.dart';

import 'favorite_screen.dart';
import 'gategories_screen.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('دليل سياحي'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: 'التصنيفات',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'المفضلة',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
