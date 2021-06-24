import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id, title, imageUrl;
  const CategoryItem(this.id, this.title, this.imageUrl);

  // Navigator.push() Method to Tavigate to other pages
  void selectGategory(BuildContext ctxxx) {
    Navigator.of(ctxxx).push(
      MaterialPageRoute(
        builder: (context) => CategoryTripsScreen(
          id,
          title,
          imageUrl,
        ),
      ),
    );
  }

  // void selectGategoryPushNamed(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed(
  //     CategoryTripsScreen.screenRoute,
  //     arguments: {
  //       'id': id,
  //       'title': title,
  //       'imageUrl': imageUrl,
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectGategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }
}
