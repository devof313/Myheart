import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heartapp/healthkit.dart';
import 'package:heartapp/pages/form.dart';
import 'package:heartapp/test.dart';
import 'package:heartapp/userspages/home.dart';
import 'package:heartapp/userspages/settings.dart';
import 'package:heartapp/userspages/userprofile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeUser(),
    LineChartSample2(),
    UserProfile(),
    SettingsUser(),
    HealthApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text(
          'MyHeart',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
              icon: Icon(
                Icons.add_task_rounded,
                size: 30,
              ))
        ],
      ),

      body: _widgetOptions[_selectedIndex],

      //Nav Bar
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 107, 198, 165),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20.00),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 107, 198, 165),
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.all(16),
            duration: Duration(milliseconds: 400),
            gap: 5,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Health History',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
              GButton(
                icon: Icons.health_and_safety,
                text: 'HealthKit',
              ),
            ],
            //switching between pages
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
