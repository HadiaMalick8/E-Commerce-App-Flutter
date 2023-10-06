import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_bar_provider.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/home/components/bottom_nav_bar.dart';
import 'custom_drawer.dart';

class CommonLayout extends StatelessWidget {
  final String title;
  final Widget body;

  CommonLayout({Key? key, required this.title, required this.body});

  List<Widget> get _screens => [
    body,
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    void navigateBottomBar(int index) {
      final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context, listen: false);
      bottomNavBarProvider.setSelectedIndex(index);
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context, provider, child) {
          return MyBottomNavBar(
            onTabChange: (index) => navigateBottomBar(index),
            currentIndex: provider.selectedIndex,
          );
        },
      ),
      drawer: const CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Online Store',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(Icons.menu),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          ];
        },
        body: Consumer<BottomNavBarProvider>(
          builder: (context, provider, child) {
            return _screens[provider.selectedIndex];
          },
        ),
      ),
    );
  }
}

