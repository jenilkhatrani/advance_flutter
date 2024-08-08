

import 'package:flutter/material.dart';

class NextAndPrevious extends StatefulWidget {
  const NextAndPrevious({super.key});

  @override
  State<NextAndPrevious> createState() => _NextAndPreviousState();
}

class _NextAndPreviousState extends State<NextAndPrevious> {

  final PageController pageController = PageController();
  int currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('next and previous page '),),
      body: Center(
        child: PageView(
          controller: pageController,
          onPageChanged: _onPageChanged,
          children: const [
            Text('Mango',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Apple',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Cherry',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Banana',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: null,
              onPressed: () {
                pageController.animateToPage(currentIndex-1,
                  duration: const Duration(microseconds: 1000),
                  curve: Curves.easeInOut,);
              },
              child: const Icon(Icons.arrow_back_ios)
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
              heroTag: 'next',
              onPressed: () {
                pageController.animateToPage(currentIndex+1,
                  duration: const Duration(microseconds: 1000),
                  curve: Curves.easeInOut,);
              },
              child: const Icon(Icons.arrow_forward_ios)
          ),
        ],
      ),
    );
  }
}
