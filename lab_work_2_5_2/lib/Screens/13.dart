import 'package:flutter/material.dart';

class corresponds extends StatefulWidget {
  @override
  correspondsState createState() => correspondsState();
}

class correspondsState extends State<corresponds> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Navigation Structure'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildPageView(['Home Page 1', 'Home Page 2', 'Home Page 3']),
          _buildPageView(['Search Page 1', 'Search Page 2', 'Search Page 3']),
          _buildPageView(['Profile Page 1', 'Profile Page 2', 'Profile Page 3']),
          _buildPageView(['Settings Page 1', 'Settings Page 2', 'Settings Page 3']),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildPageView(List<String> pages) {
    return PageView(
      children: pages.map((page) => Center(child: Text(page))).toList(),
    );
  }
}