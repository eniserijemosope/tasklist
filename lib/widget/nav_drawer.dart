import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF7F7F7),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0F0),
              border: Border(
                bottom: BorderSide(color: Color(0xFFE0E0E0)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey[200],
                  child: const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Section 2',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rounded, color: Colors.black87),
            title: const Text('Task Management'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart_rounded, color: Colors.black87),
            title: const Text('Habit Stats'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.book_rounded, color: Colors.black87),
            title: const Text('Daily Journal'),
            onTap: () {},
          ),
          const Divider(height: 1),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Section 3',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.timer_rounded, color: Colors.black87),
            title: const Text('Timer'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.water_drop_rounded, color: Colors.black87),
            title: const Text('Water Tracker'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
