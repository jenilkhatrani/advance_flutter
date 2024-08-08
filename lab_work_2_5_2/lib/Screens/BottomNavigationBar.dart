import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int initialIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' BottomNavigationBar'),),

      body: Center(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          onPageChanged: (val) {
            setState(() {
              initialIndex = val;
            });
          },
          children: const [
            Text('Home',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Search',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: initialIndex,
        indicatorColor: Colors.cyan,
        onDestinationSelected: (val) {
          setState(() {
            initialIndex = val;
          });
          pageController.animateToPage(val,
              duration: const Duration(milliseconds: 235),
              curve: Curves.bounceInOut);
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                  Icons.search,
                  size: 25),
              label: 'Search'),
          NavigationDestination(
              icon: Icon(
                  Icons.person,
                  size: 25),
              label: 'Profile'),
        ],
      ),
    );
  }
}

