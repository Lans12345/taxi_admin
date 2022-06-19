import 'package:admin_web/tabs/analytics.dart';
import 'package:admin_web/tabs/bookings.dart';
import 'package:admin_web/tabs/config.dart';
import 'package:admin_web/tabs/drivers.dart';
import 'package:admin_web/tabs/map.dart';
import 'package:admin_web/tabs/sales.dart';
import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  int _selectedIndex = 0;

  Widget tabView() {
    if (_selectedIndex == 0) {
      return const Map();
    } else if (_selectedIndex == 1) {
      return const Drivers();
    } else if (_selectedIndex == 2) {
      return const Bookings();
    } else if (_selectedIndex == 3) {
      return const Configurations();
    } else if (_selectedIndex == 4) {
      return const Analytics();
    } else if (_selectedIndex == 5) {
      return const Sales();
    } else {
      return const Map();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: const Text(
          'Admin Panel',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  Icons.map,
                ),
                selectedIcon: Icon(
                  Icons.map,
                ),
                label: Text('Map'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.person,
                ),
                selectedIcon: Icon(
                  Icons.person,
                ),
                label: Text('Drivers'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.book,
                ),
                selectedIcon: Icon(
                  Icons.book,
                ),
                label: Text('Bookings'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.settings,
                ),
                selectedIcon: Icon(
                  Icons.book,
                ),
                label: Text('Configurations'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.analytics,
                ),
                selectedIcon: Icon(
                  Icons.book,
                ),
                label: Text('Analytics'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.monetization_on,
                ),
                selectedIcon: Icon(
                  Icons.monetization_on,
                ),
                label: Text('Sales'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          tabView()
        ],
      ),
    );
  }
}
