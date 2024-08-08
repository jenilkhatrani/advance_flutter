import 'package:flutter/material.dart';

class action extends StatefulWidget {
  @override
  actionState createState() => actionState();
}

class actionState extends State<action> {
  int selectedIndex = 0;
  int ActionCount = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onPressed() {
    setState(() {
      ActionCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(' pressed $ActionCount times')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation '),
      ),
      body: Center(
        child: selectedIndex == 0
            ? const Text('Home Page')
            : selectedIndex == 1
                ? const Text('Search Page')
                : selectedIndex == 2
                    ? const Text('Profile Page')
                    : const Text('Settings Page'),
      ),
      bottomNavigationBar: NavigationBar(
        destinations:  const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
