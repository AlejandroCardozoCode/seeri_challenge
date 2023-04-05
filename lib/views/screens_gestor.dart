import 'package:flutter/material.dart';
import 'package:seeri/theme/theme.dart';
import 'package:seeri/widgets/appbar_widget.dart';

import 'view.dart';

class ScreensGestor extends StatefulWidget {
  const ScreensGestor({super.key});

  @override
  State<ScreensGestor> createState() => _ScreensGestorState();
}

class _ScreensGestorState extends State<ScreensGestor> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreen(),
  ];

  final List<AppBarWidget> _appBars = [
    const AppBarWidget(
      tittle: "CineScope",
      useIcon: false,
    ),
    const AppBarWidget(
      tittle: "Buscador",
      useIcon: false,
    ),
    const AppBarWidget(
      tittle: "Favoritos",
      useIcon: false,
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeApp.black_1,
        appBar: _appBars[_currentIndex],
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ThemeApp.black_1,
          selectedItemColor: ThemeApp.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
