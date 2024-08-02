import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_changer/providers/interfacechanger_provider.dart';
import 'package:platform_changer/screens/contact_Screen.dart';
import 'package:platform_changer/screens/setting_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int initialIndex = 0;
  PageController pageController = PageController();
  List page =[
    const Contact_Screen(),
    const setting_screen(),

  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return (Provider
        .of<interFaceChangerProvider>(context)
        .interfacechanger_model
        .isAndroid ==
        true)
        ? CupertinoTabScaffold(
      tabBar: CupertinoTabBar(

        items: [

          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle_fill)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
        ],
      ),
      tabBuilder: (context, i) {
        return page[i];
      },

    ):
         Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text(
                'Platform changer',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            body: PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              onPageChanged: (val) {
                setState(() {
                  initialIndex = val;
                });
              },
              children: const [
                Contact_Screen(),
                setting_screen(),
              ],
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
                      Icons.contacts,
                      size: 25,
                    ),
                    label: 'Contact'),
                NavigationDestination(
                    icon: Icon(Icons.settings, size: 25), label: 'Setting')
              ],
            ),
          );
  }
}
