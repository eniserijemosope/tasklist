import 'package:flutter/material.dart';
import 'package:tasklist/widget/custom_app_bar.dart';
import 'package:tasklist/widget/nav_bottom_bar.dart';
import 'package:tasklist/widget/nav_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: NavDrawer(),
      bottomNavigationBar: NavBottomBar(),
    );
  }
}
