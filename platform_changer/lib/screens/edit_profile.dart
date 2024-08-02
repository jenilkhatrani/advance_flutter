import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_changer/providers/interfacechanger_provider.dart';
import 'package:platform_changer/providers/myprofile_provider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState  extends State<EditProfile> with ChangeNotifier {
  XFile? _image;
  late DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  final ImagePicker _picker = ImagePicker();

  var myname = TextEditingController();
  var myphone = TextEditingController();
  var gender = TextEditingController();
  var email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return (Provider.of<interFaceChangerProvider>(context)
        .interfacechanger_model
        .isAndroid ==
        true)
        ?CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Edit Profile'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text('Save'),
            onPressed: () {
              onPressed: () {
                Provider.of<MyprofileProvider>(context,
                    listen: false)
                    .UpdateProfile(myname.text, myphone.text, gender.text, email.text, _image!.path);
                Navigator.pop(context);
              };
              // You can handle save action here
              Navigator.pop(context);
            },
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              controller: myname,
              placeholder: 'Name',
              style: TextStyle(color: CupertinoColors.black),
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              controller: myphone,
              placeholder: 'Phone Number',
              keyboardType: TextInputType.phone,
            ),
          ],
        )
    )

    :Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [

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
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: myname,
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        label: const Text('Name'),
                        labelStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: myphone,
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        label: const Text('Phone number'),
                        labelStyle: const TextStyle(fontSize: 20)),
                  ),
                ), SizedBox(height: 20,),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: gender,
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        label: const Text('Gender'),
                        labelStyle: const TextStyle(fontSize: 20)),
                  ),
                ), SizedBox(height: 20,),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        label: const Text('E-mail'),
                        labelStyle: const TextStyle(fontSize: 20)),
                  ),
                ),

                SizedBox(height: 20,),
                (pickedDate == null)
                    ? Container()
                    : Text(
                  style: const TextStyle(fontSize: 25),
                  'DOB : ${pickedDate!.day} / ${pickedDate!.month} / ${pickedDate!.year}',
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          OutlinedButton(
              style: const ButtonStyle(
                  iconColor: WidgetStateColor.transparent),
              onPressed: () async {
                pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                  initialDatePickerMode: DatePickerMode.day,
                  // initialEntryMode: DatePickerEntryMode.calendarOnly
                );

                setState(() {});
              },
              child: const Text('Open date picker')),
          TextButton(
              onPressed: () {
                Provider.of<MyprofileProvider>(context, listen: false).UpdateProfile(myname.text, myphone.text, gender.text, email.text, _image!.path);
                Navigator.pop(context);
              },
              child: Text('Submit'))
        ]),
      ),
    );
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
