import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/category_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const screenRoute = '/';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: Categories_data.map(
          (categoryData) => CategoryItem(
            categoryData.id,
            categoryData.title,
            categoryData.imageUrl,
          ),
        ).toList(),
      ),
    );
  }
}
