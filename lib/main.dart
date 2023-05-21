import 'package:flutter/material.dart';
import './screens/favorites_screen.dart';
import './screens/tabs_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/trip_detail_screen.dart';
import './screens/category_trips_screen.dart';
import './screens/flters_screen.dart';
import './app_data.dart';
import './models/trip.dart';

void main() {
  runApp(TravelingApp());
}

class TravelingApp extends StatefulWidget {
  @override
  State<TravelingApp> createState() => _TravelingAppState();
}

class _TravelingAppState extends State<TravelingApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isInSummer != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips
            .add((Trips_data.firstWhere((trip) => trip.id == tripId)));
      });
    }
  }

  bool _isFavarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
      ],
      title: 'Traveling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      //routes: منشئ كلمة مفتاحية(المسارات) وهو يحدد ويسمي الصفحات التي نريد فتحها
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) =>
            TripDetailScreen(_manageFavorite, _isFavarite),
        //FavoritesScreen.screenRoute: (ctx) => FavoritesScreen(),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
