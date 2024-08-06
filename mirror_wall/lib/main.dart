import 'package:flutter/material.dart';
import 'package:mirror_wall/HomeScreen.dart';
import 'package:mirror_wall/provider/connectivityProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
   providers: [
     ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
   ],
child: Myapp(),
  )
  );
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

