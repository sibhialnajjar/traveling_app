import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';
import '../widget/app_drawer.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({super.key});
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, dynamic>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title']),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'التصنيفات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'المفضلة',
            ),
          ]),
    );
  }
}
