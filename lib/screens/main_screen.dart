import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/screens/album_overview_screen.dart';
import 'package:hactiv8_bithealth_flutter/screens/post_overview_screen.dart';
import 'package:hactiv8_bithealth_flutter/screens/user_overview_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    PostOverviewScreen(),
    AlbumOverviewScreen(),
    UserOverviewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Album",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "User",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (selectedIndex) {
          setState(() {
            _selectedIndex = selectedIndex;
          });
        },
      ),
    );
  }
}
