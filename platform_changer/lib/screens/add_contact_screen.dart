// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_changer/models/contact_model.dart';
import 'package:platform_changer/providers/contact_provider.dart';
import 'package:platform_changer/providers/interfacechanger_provider.dart';
import 'package:provider/provider.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  var name = TextEditingController();
  var phone = TextEditingController();
  var mail = TextEditingController();
  var instagram = TextEditingController();
  var facebook = TextEditingController();
  var twitter = TextEditingController();

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  List allContacts = [];

  int currentStep = 0;
  continuestep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1;
      });
    }
  }

  onStepCancel() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  int index = 0;
  onStepTapped(int value) {
    setState(() {
      currentStep == value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<interFaceChangerProvider>(context)
                .interfacechanger_model
                .isAndroid ==
            true)
        ? CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Add Contact'),
      ),
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 120,),
                SizedBox(
                  width: 350,
                  child: CupertinoTextField(
                    controller: name,
                    placeholder: '  Name',
                    suffix: Icon(Icons.drive_file_rename_outline,color: CupertinoColors.black,),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              SizedBox(height: 20,),
              SizedBox(
                  width: 350,
                  child: CupertinoTextField(
                    controller: phone,
                    placeholder: '  phone',
                    suffix: Icon(Icons.drive_file_rename_outline,color: CupertinoColors.black,),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                CupertinoButton
                  (child: Text('Save'),
                    onPressed: (){
                      Provider.of<ContactProvider>(context, listen: false)
                          .addContact(
                          data: ContactModel(
                            name: name.text,
                            phone: phone.text,
                          ));
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ))
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Add contact'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                ),

                (_image == null)?
                CircleAvatar(maxRadius: 70,):
                CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: FileImage(File(_image!.path)),
                ),

                TextButton(
                  onPressed: () {
                    getImageGallery();
                  },
                  child: const Text('pick image from gallary'),
                ),
                TextButton(
                  onPressed: () {
                    getImageCamera();
                  },
                  child: const Text('pick image from camera'),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: Text('Name'),
                      labelStyle: TextStyle(fontSize: 20)),
                  controller: name,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: Text('Phone number'),
                      labelStyle: TextStyle(fontSize: 20)),
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<ContactProvider>(context, listen: false)
                          .addContact(
                              data: ContactModel(
                        name: name.text,
                        phone: phone.text,
                      ));
                      Navigator.pop(context);
                    },
                    child: Text('Save'))
              ],
            ));
  }
  Future getImageGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future getImageCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

}
