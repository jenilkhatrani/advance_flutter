
import 'package:flutter/material.dart';

class PageViewWithIndicator extends StatefulWidget {
  const PageViewWithIndicator({super.key});

  @override
  State<PageViewWithIndicator> createState() => _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends State<PageViewWithIndicator> {

  int currentPage = 0;

  final List<String> images = [
    'assets/1.jpg',
    'assets/2.jpeg',
    'assets/3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        appBar: AppBar(
          title: const Text('PageView with Indicator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      );
  }
}

