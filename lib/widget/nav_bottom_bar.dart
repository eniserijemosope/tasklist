import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      backgroundColor: Colors.white,
      color: const Color(0xFF07264A),
      buttonBackgroundColor: const Color(0xFF6EC6FF),
      animationDuration: const Duration(milliseconds: 300),
      items: [
        CurvedNavigationBarItem(
          child: const Icon(Icons.checklist_rounded, color: Colors.white, size: 20),
          label: 'Routine',
          labelStyle: const TextStyle(color: Colors.white),
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.water_drop_outlined, color: Colors.white, size: 20),
          label: 'Water',
          labelStyle: const TextStyle(color: Colors.white),
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.person_outline, color: Colors.white, size: 20),
          label: 'Profile',
          labelStyle: const TextStyle(color: Colors.white),
        ),
      ],
      onTap: onTap,
    );
  }
}
