import 'package:flutter/material.dart';
import 'package:tasklist/widget/custom_app_bar.dart';
import 'package:tasklist/widget/nav_bottom_bar.dart';
import 'package:tasklist/widget/nav_drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Tracks active screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavDrawer(),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Rebuilds the UI with the selected page
          });
        },
      ),
      body: Center(
        child: Text('Active Screen Index: $_selectedIndex'), // Swap this with actual pages later
      ),
    );
  }
}
