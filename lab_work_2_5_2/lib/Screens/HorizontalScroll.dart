
import 'package:flutter/material.dart';

class HorizontalScroll extends StatefulWidget {
  const HorizontalScroll({super.key});

  @override
  State<HorizontalScroll> createState() => HorizontalScrollState();
}

class HorizontalScrollState extends State<HorizontalScroll> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal scroll',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw1ijzwOxytbduDrUQitwrCtFgqdpdvyjCaA&usqp=CAU'),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtO6D5qin-8_JVzi2FZsV6CiManLzpf9M7AQ&usqp=CAU'),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKkE37YAncWg8pt-081iNOwEVZnokX0BKGmg&usqp=CAU'),
        ],
      ),
    );
  }
}
