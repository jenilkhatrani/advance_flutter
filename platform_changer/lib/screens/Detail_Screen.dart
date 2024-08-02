import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_changer/models/contact_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/contact_provider.dart';
import '../providers/myprofile_provider.dart';
import 'edit_contact_screen.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {


  @override
  Widget build(BuildContext context) {
    ContactModel contact =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


        Container(
          margin: const EdgeInsets.all(20),
          height: 320,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [

              SizedBox(height: 20,),
              CircleAvatar(
                maxRadius: 40,
                backgroundImage: FileImage(File( Provider.of<MyprofileProvider>(context, listen: true)
                    .myProfileModel.image)),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Center(
                  child: Text(
                    contact.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                subtitle: Center(
                  child: Text(
                    ('Mobile :  ${contact.phone}'),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.cyan,
                    child: IconButton(
                      onPressed: () async{
                        await launchUrl(Uri.parse('tel:' + '+91 ${contact.phone}'));
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.cyan,
                    child: IconButton(
                      onPressed: ()async {
                        await launchUrl(Uri.parse('sms:' + ' ${contact.phone}'));
                      },
                      icon: const Icon(
                        Icons.message,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.cyan,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),

      ]
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 40,),
           FloatingActionButton(
             heroTag: null,
             onPressed: (){},
           child: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditContactScreen(contact: contact,)));
           }, icon: Icon(Icons.edit)),
           ),
            SizedBox(width: 30,),
            FloatingActionButton(
              heroTag: null,
              onPressed: (){},
           child: IconButton(
               onPressed: () {
                 Provider.of<ContactProvider>(context, listen: false)
                     .deleteContact(
                     data: contact);
                 Navigator.pop(context);
               },
            icon: Icon(Icons.delete)),
           ),
          ],
        )
    );
  }


}
