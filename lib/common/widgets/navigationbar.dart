import 'package:flutter/material.dart';
import 'package:ui_app/core/pages/Additional/additional.dart';
import 'package:ui_app/core/pages/AudioPage/audio.vedio.dart';
import 'package:ui_app/core/pages/HomePage/homepage.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AudioVideo(),
    ProfilePage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
