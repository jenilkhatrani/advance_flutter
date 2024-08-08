import 'package:flutter/material.dart';

class badgecount extends StatefulWidget {
  @override
  badgecountState createState() => badgecountState();
}

class badgecountState extends State<badgecount> {
  int selectedIndex = 0;
  int notificationCount = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation with Badge'),
      ),
      body: Center(
        child: selectedIndex == 0
            ? const Text('Home Page')
            : selectedIndex == 1
            ? const Text('Search Page')
            : const Text('Profile Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: BadgeCount(
              child: const Icon(Icons.person),
              count: notificationCount,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            notificationCount++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BadgeCount extends StatelessWidget {
  final Widget child;
  final int count;

  const BadgeCount({
    Key? key,
    required this.child,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (count > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}