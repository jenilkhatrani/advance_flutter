import 'package:flutter/material.dart';

class pageview extends StatefulWidget {
  const pageview({super.key});

  @override
  State<pageview> createState() => pageviewState();

}

class pageviewState extends State<pageview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pageview',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                'Screen 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                'Screen 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Screen 3',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
