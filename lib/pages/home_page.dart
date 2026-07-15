import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.transparent, // Modern apps use transparent or surface colors
  elevation: 0,
  scrolledUnderElevation: 0, // Prevents ugly color changes on scroll
  centerTitle: true, // Clean, centered typography
  title: const Text(
    'Tasklist', // Swapped rigid all-caps for modern clean casing
    style: TextStyle(
      color: Colors.black87, // High contrast text color
      fontSize: 20,
      fontWeight: FontWeight.w700, // Bold, premium weight
      letterSpacing: 1.2,
    ),
  ),
  leading: Padding(
    padding: const EdgeInsets.only(left: 16.0), // Comfortable screen padding
    child: CircleAvatar(
      backgroundColor: Colors.green[50], // Soft, modern background accent
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.person_outline, color: Colors.green[800]), // Modern outlined icon
      ),
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: CircleAvatar(
        backgroundColor: Colors.green[50],
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_rounded, color: Colors.green[800]), // Added standard modern action item
        ),
      ),
    ),
  ],
)


      
      );
  }
}
