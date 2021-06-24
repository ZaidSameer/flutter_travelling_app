import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '/app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';
  final String categoryId;
  final String categoryTitle;
  final String categoryImage;

  CategoryTripsScreen(
    this.categoryId,
    this.categoryTitle,
    this.categoryImage,
  );
  @override
  Widget build(BuildContext context) {
    // Revice the data from the category_item.dart
    //final routeArgument =
    //ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final categoryId = routeArgument['id'] as String;
    //final categoryTitle = routeArgument['title'] as String;
    //final categoryImage = routeArgument['imageUrl'] as String;

    final filteredTrip = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset.zero,
                  color: Colors.blueGrey.withOpacity(0.4),
                ),
              ],
            ),
            // height: 300,
            child: TripItem(
              id: filteredTrip[index].id,
              imageUrl: filteredTrip[index].imageUrl,
              title: filteredTrip[index].title,
              duration: filteredTrip[index].duration,
              season: filteredTrip[index].season,
              tripType: filteredTrip[index].tripType,
            ),
          );
        },
        itemCount: filteredTrip.length,
      ),
    );
  }
}
