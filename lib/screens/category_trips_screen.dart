import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widget/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;
  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void didChangeDependencies() {
    final routeArgument = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    //final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //ListView.builder : كما قلنا من قبل استخدمناه لأننا سنضيف رحلات في المستقبل
      //ايضا لكي يقوم التطبيق
      //بتحميل فقط المحتوى الموجودعلى الشاشة
      //أي عند النزول للأسفل سيتم تحميل الصور او الملفات تدريجيا
      // وهذا سيفيدنا في سرعة اداء التطبيق
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            //  removItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
