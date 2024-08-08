import 'package:flutter/material.dart';
import 'package:lab_work_2_5_2/Screens/12.dart';
import 'package:lab_work_2_5_2/Screens/13.dart';
import 'package:lab_work_2_5_2/Screens/BottomNavigationBar.dart';
import 'package:lab_work_2_5_2/Screens/DynamicNumberPage.dart';
import 'package:lab_work_2_5_2/Screens/HorizontalScroll.dart';
import 'package:lab_work_2_5_2/Screens/NextAndPrevious.dart';
import 'package:lab_work_2_5_2/Screens/PageViewWithIndicator.dart';
import 'package:lab_work_2_5_2/Screens/VerticalScroll.dart';
import 'package:lab_work_2_5_2/Screens/badgecount.dart';
import 'package:lab_work_2_5_2/Screens/custombottom.dart';
import 'package:lab_work_2_5_2/Screens/pageview.dart';

void main(){
  runApp(const MaterialApp(
    home:Myapp(),
  ));
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();

}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Page-view',
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const pageview()));
            }, child: const Text('1 page view',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HorizontalScroll()));
            }, child: const Text(' 2 page view (Horizontal)',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerticalScroll()));
            }, child: const Text('3 page view (vertical)',style: TextStyle(fontSize: 20),)),


            const Divider(thickness: 2,),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const PageViewWithIndicator()));
            }, child: const Text('4 PageView With Indicator',style: TextStyle(fontSize: 20),)),


            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   const DynamicNumberPage()));
            }, child: const Text(' 5 Dynamic from list',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   const NextAndPrevious()));
            }, child: const Text(' 6 Next and previous indicator',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BottomNavigation()));
            }, child: const Text(' 7/8 Bottom navigation bar',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  custombottom()));
            }, child: const Text(' 9/11 Bottom navigation bar',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  badgecount()));
            }, child: const Text(' 10 badge count',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  action()));
            }, child: const Text(' 12 badge count',style: TextStyle(fontSize: 20),)),

            const Divider(thickness: 2,),

            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  corresponds()));
            }, child: const Text(' 13 corrosponds',style: TextStyle(fontSize: 20),)),

          ],
        ),
      ),
    );
  }
}




