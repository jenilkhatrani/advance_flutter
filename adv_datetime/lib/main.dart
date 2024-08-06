import 'dart:async';

import 'package:adv_datetime/interfacechanger_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main(){
  runApp(MaterialApp(
    home: Myapp(),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => interFaceChangerProvider()),
      ],
      builder: (context, _) =>
          MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => Homescreen(),
              }),
    );
  }
}
