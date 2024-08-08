
import 'package:flutter/material.dart';

class VerticalScroll extends StatefulWidget {
  const VerticalScroll({super.key});

  @override
  State<VerticalScroll> createState() => _VerticalScrollState();
}

class _VerticalScrollState extends State<VerticalScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Vertical scroll',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children:[
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw1ijzwOxytbduDrUQitwrCtFgqdpdvyjCaA&usqp=CAU'),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtO6D5qin-8_JVzi2FZsV6CiManLzpf9M7AQ&usqp=CAU'),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKkE37YAncWg8pt-081iNOwEVZnokX0BKGmg&usqp=CAU'),
        ],
      ),
    );
  }
}
