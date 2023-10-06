import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/common_layout.dart';

import '../../components/custom_drawer.dart';
import '../../providers/bottom_nav_bar_provider.dart';
import '../cart/cart_screen.dart';
import '../categories/categories_screen.dart';
import 'components/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = const [
    CategoriesScreen(),
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

