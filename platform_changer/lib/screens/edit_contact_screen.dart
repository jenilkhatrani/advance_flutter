import 'package:flutter/material.dart';
import 'package:platform_changer/models/contact_model.dart';
import 'package:provider/provider.dart';

import '../providers/contact_provider.dart';

class EditContactScreen extends StatelessWidget {
  final ContactModel? contact;
   const EditContactScreen({super.key, this.contact});


  @override
  Widget build(BuildContext context) {

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

  name.text = contact!.name;
  phone.text = contact!.phone;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact',style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      label: const Text('Name'),
                      labelStyle: const TextStyle(fontSize: 20)),
                  controller: name,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      label: const Text('Name'),
                      labelStyle: const TextStyle(fontSize: 20)),
                  controller: phone,
                ),
              ),

              TextButton(
                  onPressed: () {

                    Provider.of<ContactProvider>(context, listen: false)
                        .UpdateContact(
                        ContactModel(
                          name: name.text,
                          phone: phone.text,
                        ));
                    Navigator.pop(context);
                  },
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
