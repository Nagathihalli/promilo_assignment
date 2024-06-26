import 'package:flutter/material.dart';
import 'package:promilo_assignment/pages/nav_pages/account_page.dart';
import 'package:promilo_assignment/pages/nav_pages/explore_page.dart';
import 'package:promilo_assignment/pages/nav_pages/home_page.dart';
import 'package:promilo_assignment/pages/nav_pages/meet_up_page.dart';
import 'package:promilo_assignment/pages/nav_pages/prolit_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPageIndex = 0;

  final List<Widget> indexPages = [
    const HomePage(),
    const ProletPage(),
    const MeetUpPage(),
    const ExplorePage(),
    const AccountPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          title: const Text(
            'Individual Meetup',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: indexPages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.black12),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: "Prolet",
                backgroundColor: Colors.black12),
            BottomNavigationBarItem(
                icon: Icon(Icons.handshake),
                label: "Meetup",
                backgroundColor: Colors.black12),
            BottomNavigationBarItem(
                icon: Icon(Icons.content_paste_search),
                label: "Explore",
                backgroundColor: Colors.black12),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
                backgroundColor: Colors.black12)
          ]),
    );
  }
}
