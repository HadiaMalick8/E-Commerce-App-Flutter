import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import 'providers/bag_provider.dart';
import 'providers/bottom_nav_bar_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/checkout_provider.dart';
import 'providers/filter_option_provider.dart';
import 'providers/shoe_provider.dart';
import 'providers/sort_option_provider.dart';
import 'providers/watch_provider.dart';
import 'res/image_strings.dart';
import 'res/text_strings.dart';
import 'screens/bags_collection/bags_screen.dart';
import 'screens/shoes_collection/shoes_screen.dart';
import 'screens/watches_collection/watches_screen.dart';
import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => SortOptionProvider()),
        ChangeNotifierProvider(create: (context) => FilterOptionProvider()),
        ChangeNotifierProvider(create: (context) => BagProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
        ChangeNotifierProvider(create: (context) => ShoeProvider()),
        ChangeNotifierProvider(create: (context) => WatchProvider()),
      ],
      builder: (context, child) => MaterialApp(
        routes: {
          '/home': (context) => const HomeScreen(),
          '/shoes': (context) => const ShoesScreen(),
          '/watches': (context) => const WatchesScreen(),
          '/bags': (context) => const BagsScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Online Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.grey, primary: Colors.black),
          useMaterial3: true,
        ),
        home: WelcomeScreen(
          title: titleWelcome,
          subTitle: subTitleWelcome,
          btnText: txtShopNow,
          img: imgWelcome,
        ),
      ),
    );
  }
}
