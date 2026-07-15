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
      backgroundColor: const Color(0xFFB7D7B0),
      color: const Color(0xFFB7D7B0),
      buttonBackgroundColor: const Color(0xFF7FAF7B),
      items: [
        CurvedNavigationBarItem(
          child: const Icon(Icons.person_outline, color: Colors.white),
          label: 'Profile',
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.water_drop_outlined, color: Colors.white),
          label: 'Water',
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.notifications_none_rounded, color: Colors.white),
          label: 'Notification',
        ),
      ],
      onTap: onTap,
    );
  }
}
