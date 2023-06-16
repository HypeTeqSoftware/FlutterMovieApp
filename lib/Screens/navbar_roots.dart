import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photoplay_app/Screens/download_screen.dart';
import 'package:photoplay_app/Screens/home_screen.dart';
import 'package:photoplay_app/Screens/profile_screen.dart';
import 'package:photoplay_app/Screens/search_screen.dart';

class NavbarRoots extends StatefulWidget {
  const NavbarRoots({Key? key}) : super(key: key);

  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //Home Screen
    const HomeScreen(),
    //Messages Screen
    const SearchScreen(),
    //Schedule Screen
    const DownloadScreen(),
    //Setting Screen
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade200 :  Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 54,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
          child: BottomNavigationBar(
            elevation: 5,
            backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade200 :  Colors.white12,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).brightness == Brightness.light ? Colors.amber.shade600 : Colors.amber.shade600,
            unselectedItemColor:Theme.of(context).brightness == Brightness.light ? Colors.grey : Colors.white60,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search,), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_arrow_down_on_square), label: "Downloads"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
