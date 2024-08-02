import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_changer/providers/interfacechanger_provider.dart';
import 'package:platform_changer/providers/myprofile_provider.dart';
import 'package:provider/provider.dart';
import '../providers/theme_model_provider.dart';

class setting_screen extends StatefulWidget {
  const setting_screen({super.key});

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<interFaceChangerProvider>(context)
                .interfacechanger_model
                .isAndroid ==
            true)
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(),

            child: SafeArea(
              child: Expanded(
                child: Column(
                  children: [
                
                    SizedBox(height: 50,),
                
                    Row(
                      children: [
                        Text('Name : ',style: TextStyle(fontSize: 20,color: CupertinoColors.black)),
                        Spacer(),
                        Text( Provider.of<MyprofileProvider>(context, listen: true)
                            .myProfileModel.myname,
                          style: TextStyle(fontSize: 30,color: CupertinoColors.black),),
                      ],
                    ),
                
                    Row(
                      children: [
                        Text('Phone no : ',style: TextStyle(fontSize: 20,color: CupertinoColors.black)),
                        Text(
                          Provider.of<MyprofileProvider>(context, listen: true)
                              .myProfileModel.myphone,
                          style: TextStyle(fontSize: 20,color: CupertinoColors.black),
                        ),
                      ],
                    ),
                
                    CupertinoButton(onPressed: (){
                      Navigator.pushNamed(context, 'edit_profile');
                    }, child: Icon(CupertinoIcons.pen),
                    ),
                    Row(
                      children: [
                        (Provider.of<interFaceChangerProvider>(context)
                            .interfacechanger_model
                            .isAndroid)
                            ? Text(
                          'android Mode',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                            : Text(
                          'ios Mode',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        CupertinoSwitch(
                            value: (Provider.of<interFaceChangerProvider>(context)
                                .interfacechanger_model
                                .isAndroid),
                            onChanged: (value) {
                              Provider.of<interFaceChangerProvider>(context,
                                  listen: false)
                                  .interfacechanger();
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ))
        : Scaffold(
            body: Column(
              children: [

                Container(
                  margin: const EdgeInsets.all(20),
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15)),

                  child: Column(
                    children: [

                      Column(children: [
                        SizedBox(height: 20,),
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundImage: FileImage(File( Provider.of<MyprofileProvider>(context, listen: true)
                              .myProfileModel.image)),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text('Name : ',style: TextStyle(fontSize: 20,color: Colors.white)),
                            Spacer(),
                            Text(
                              Provider.of<MyprofileProvider>(context, listen: true)
                                  .myProfileModel.myname,
                              style: TextStyle(fontSize: 30,color: Colors.white),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),

                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Phone no : ',style: TextStyle(fontSize: 20,color: Colors.white)),
                            Spacer(),
                            Text(
                              Provider.of<MyprofileProvider>(context, listen: true)
                                  .myProfileModel.myphone,
                              style: TextStyle(fontSize: 20,color: Colors.white),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),
                      ],),
                       Spacer(),
                       IconButton.filled(onPressed: (){
                         Navigator.pushNamed(context, 'edit_profile');
                       }, icon: Icon(Icons.edit,size: 30,)),SizedBox(height: 10,)
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    (Provider.of<thememodelprovider>(context)
                            .themeModel
                            .isThemeDark)
                        ? Text(
                            'light Mode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'dark Mode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                    Spacer(),
                    Switch(
                        value: (Provider.of<thememodelprovider>(context)
                            .themeModel
                            .isThemeDark),
                        onChanged: (value) {
                          Provider.of<thememodelprovider>(context,
                                  listen: false)
                              .theme();
                        }),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    (Provider.of<interFaceChangerProvider>(context)
                            .interfacechanger_model
                            .isAndroid)
                        ? Text(
                            'android Mode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'ios Mode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                    Spacer(),
                    Switch(
                        value: (Provider.of<interFaceChangerProvider>(context)
                            .interfacechanger_model
                            .isAndroid),
                        onChanged: (value) {
                          Provider.of<interFaceChangerProvider>(context,
                                  listen: false)
                              .interfacechanger();
                        }),
                  ],
                ),
              ],
            ),
          );
  }
}
