import 'package:flutter/material.dart';

class DynamicNumberPage extends StatefulWidget {
  const DynamicNumberPage({super.key});

  @override
  State<DynamicNumberPage> createState() => DynamicNumberPageState();
}

class DynamicNumberPageState extends State<DynamicNumberPage> {

  int currentPage = 0;

  final List<String> fruits = [
    'Mango',
    'Apple',
    'Cherry',
    'banana',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List dynamic',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: PageView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
          return Text(
            fruits[index],style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
          );
        },),
      ),
    );
  }
}
