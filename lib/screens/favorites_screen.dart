import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widget/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({super.key});

  static const screenRoute = '/favorites';

  final List<Trip> favoriteTrips;
  FavoritesScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(
        child: Text('ليس لديك اي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            //  removItem: _removeTrip,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
