import 'package:flutter/material.dart';
import '../widget/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _summer = false;
  bool _winter = false;
  bool _family = false;

  @override
  initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;

    super.initState();
  }

  SwitchListTile buildSwitchLidtTile(
      String title, String subTitle, bool curretnValue, Function(bool) update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: curretnValue,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildSwitchLidtTile(
                  'الرحلات الصيفية فقط',
                  'إظهار الرحلات في فصل الصيف',
                  _summer,
                  (value) {
                    setState(() {
                      _summer = value;
                    });
                  },
                ),
                buildSwitchLidtTile(
                  'الرحلات الشتوية فقط',
                  'إظهار الرحلات في فصل الشتاء',
                  _winter,
                  (value) {
                    setState(() {
                      _winter = value;
                    });
                  },
                ),
                buildSwitchLidtTile(
                  'الرحلات العائلية فقط',
                  'إظهار الرحلات العائلية',
                  _family,
                  (value) {
                    setState(() {
                      _family = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
