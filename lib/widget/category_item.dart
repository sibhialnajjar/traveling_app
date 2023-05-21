import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(
    this.id,
    this.title,
    this.imageUrl,
  );
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryTripsScreen.screenRoute,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      //splashColor : عندما نضغط على الشاشة للإنتقال إلى
      //صفحة جديدةيظهر لنا ثيم او ايموجي يبين لنا
      //اننا ضغطنا على هذه الصفحة أو أيقونة الصفحة
      splashColor: Theme.of(context).primaryColor,
      //borderRaduis: هو أيضا ستايل لزوايا هذا الاموجي او الثيم
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
