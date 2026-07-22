import 'package:flutter/material.dart';
import 'package:tasklist/pages/profile_screen.dart';
import 'package:tasklist/pages/routine_screen.dart';
import 'package:tasklist/pages/water_screen.dart';
import 'package:tasklist/widget/custom_app_bar.dart';
import 'package:tasklist/widget/nav_bottom_bar.dart';
import 'package:tasklist/widget/nav_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    RoutineScreen(),
    WaterScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavDrawer(),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _screens[_selectedIndex],
    );
  }
}
