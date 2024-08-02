import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_changer/providers/contact_provider.dart';
import 'package:platform_changer/providers/interfacechanger_provider.dart';
import 'package:platform_changer/providers/myprofile_provider.dart';
import 'package:platform_changer/providers/theme_model_provider.dart';
import 'package:platform_changer/screens/Detail_Screen.dart';
import 'package:platform_changer/screens/add_contact_screen.dart';
import 'package:platform_changer/screens/contact_Screen.dart';
import 'package:platform_changer/screens/edit_contact_screen.dart';
import 'package:platform_changer/screens/edit_profile.dart';
import 'package:platform_changer/screens/homescreen.dart';
import 'package:platform_changer/screens/setting_screen.dart';
import 'package:platform_changer/screens/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => thememodelprovider()),
      ChangeNotifierProvider(create: (context) => ContactProvider()),
      ChangeNotifierProvider(create: (context) => interFaceChangerProvider()),
      ChangeNotifierProvider(create: (context) => MyprofileProvider()),
    ],
    child: MyApp(),
  ),

  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return (Provider.of<interFaceChangerProvider>(context)
        .interfacechanger_model
        .isAndroid)?
    CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: _isDarkMode ? themes().darkTheme : themes().lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) =>  HomeScreen(),
          'add': (context) =>  Add_Screen(),
          'detail_page': (context)=>  Detail_Page(),
          'contact_screen': (context)=>Contact_Screen(),
          'setting_screen':(context)=>setting_screen(),
          'edit_profile' : (context) => EditProfile(),
        }
    ):
    MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themes().lighttheme,
          darkTheme: themes().darktheme,
          themeMode: (Provider.of<thememodelprovider>(context)
              .themeModel
              .isThemeDark ==
              false)
              ? ThemeMode.light
              : ThemeMode.dark,
          initialRoute: '/',
          routes: {
            '/': (context) =>  HomeScreen(),
            'add': (context) =>  Add_Screen(),
            'detail_page': (context)=>  Detail_Page(),
            'contact_screen': (context)=>Contact_Screen(),
            'setting_screen':(context)=>setting_screen(),
            'edit_profile' : (context) => EditProfile(),
            'edit_contact' : (context) => EditContactScreen()
          }
          );
  }
}