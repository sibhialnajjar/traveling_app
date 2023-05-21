import 'package:flutter/material.dart';
import '../screens/flters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile buildListTile(
      BuildContext context, IconData icon, String title, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTapLink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'دليل سياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(context, Icons.card_travel, 'الرحلات', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(context, Icons.card_travel, 'الفلترة', () {
            Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
