import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  // final Function removItem;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    // required this.removItem,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'الشتاء';

      case Season.Spring:
        return 'ربيع';

      case Season.Summer:
        return 'صيف';

      case Season.Autumn:
        return 'خريف';

      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'إستكشاف';

      case TripType.Recovery:
        return 'نقاهة';

      case TripType.Activities:
        return 'أنشطة';
      case TripType.Therapy:
        return 'علاج';
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailScreen.screenRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        //   removItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).indicatorColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text('$duration أيام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).indicatorColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
