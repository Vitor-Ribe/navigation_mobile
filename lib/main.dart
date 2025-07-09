import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:navigation_mobile/pages/favourite_page.dart';
import 'package:navigation_mobile/pages/home_page.dart';
import 'package:navigation_mobile/pages/imc_page.dart';
import 'package:navigation_mobile/pages/profile_page.dart';
import 'package:navigation_mobile/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remover banner de debug
      title: 'Mobile Trabalho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final screens = [
    HomePage(),
    ImcPage(),
    FavouritePage(),
    SettingsPage(),
    ProfilePage()
  ];

  final pageTitles = [
    'Home',
    'Cálculo de IMC',
    'Favourite Page',
    'Settings Page',
    'Profile Page'
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.monitor_heart, size: 30, color: Colors.white),
      Icon(Icons.favorite, size: 30, color: Colors.white),
      Icon(Icons.settings, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white)
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(pageTitles[index], style: TextStyle(color: Colors.blue.shade900)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        color: Colors.blue.shade700,
        animationDuration: Duration(milliseconds: 300),
        height: 75,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}


