import 'package:flutter/material.dart';
import '../screens/trip_details_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final customTextStyle = TextStyle(fontFamily: "The Sans Arabic");
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  TripItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
  }) : super(key: key);

  String get seasonText {
    // Using switch
    switch (season) {
      case Season.Autumn:
        return 'خريف';

      case Season.Spring:
        return 'ربيع';

      case Season.Summer:
        return 'صيف';

      case Season.Winter:
        return 'شتاء';

      default:
        return 'غير معروف';
    }

    // Using If Statment
    // if (season == Season.Autumn) {
    //   return 'خريف';
    // }
    // if (season == Season.Spring) {
    //   return 'ربيع';
    // }
    // if (season == Season.Summer) {
    //   return 'صيف';
    // }
    // if (season == Season.Winter) {
    //   return 'شتاء';
    // }
  }

  String get tripTypeText {
    // Using switch
    switch (tripType) {
      case TripType.Activities:
        return 'أنشطة';

      case TripType.Exploration:
        return 'إستكشاف';

      case TripType.Recovery:
        return 'نقاهة';

      case TripType.Therapy:
        return 'معالجة';

      default:
        return 'غير معروف';
    }
  }

  void selectedItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TripDetailsScreen(
          tripId: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '$duration يوم ',
                        style: customTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text(seasonText, style: customTextStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text(tripTypeText, style: customTextStyle),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
