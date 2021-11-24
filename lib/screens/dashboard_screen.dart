import 'package:flutter/material.dart';
import 'package:music_playground/global/appcolors.dart';
import 'package:music_playground/screens/settings_screen.dart';
import 'package:music_playground/screens/songs/playlist_screen.dart';
import 'package:music_playground/screens/songs/songs_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    PlaylistScreen(),
    SongsScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'School',
        ),
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.gray,
        backgroundColor: AppColors.background,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 30,
        onTap: _onItemTapped,

      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
