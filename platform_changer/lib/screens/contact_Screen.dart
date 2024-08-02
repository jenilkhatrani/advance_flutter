import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact_model.dart';
import '../providers/contact_provider.dart';
import '../providers/interfacechanger_provider.dart';

class Contact_Screen extends StatefulWidget {
  const Contact_Screen({super.key});

  @override
  State<Contact_Screen> createState() => _Contact_ScreenState();
}

class _Contact_ScreenState extends State<Contact_Screen> {
  @override
  Widget build(BuildContext context) {
    if ((Provider.of<interFaceChangerProvider>(context)
            .interfacechanger_model
            .isAndroid ==
        true)) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle:Text(
            'Platform changer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white),
          ),
          backgroundColor: CupertinoColors.black,
        ),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                      child: Text('Add contact'),
                      onPressed: () {
                        Navigator.pushNamed(context, 'add');
                      }),

    Container(
      child: ListView.builder(
      itemCount:
      Provider.of<ContactProvider>(context).allContacts.length,
      itemBuilder: (context, index) {
        List<ContactModel> contacts =
            Provider
                .of<ContactProvider>(context)
                .allContacts;

        return CupertinoListTile(
          title: Text(
            Provider
                .of<ContactProvider>(context, listen: false)
                .allContacts[index]
                .name,
            style: TextStyle(fontSize: 20),
          ),
          leading: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 15),
          ),
          subtitle: Text(
              Provider
                  .of<ContactProvider>(context, listen: false)
                  .allContacts[index]
                  .phone),
          onTap: () {
            Navigator.of(context).pushNamed("detail_page",
                arguments: contacts[index]);
          },
        );
        }),
    )
                ],
              ),
            ),
          ));
    } else {
      return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount:
                      Provider.of<ContactProvider>(context).allContacts.length,
                  itemBuilder: (context, index) {
                    List<ContactModel> contacts =
                        Provider.of<ContactProvider>(context).allContacts;

                    return ListTile(
                      title: Text(
                        Provider.of<ContactProvider>(context, listen: false)
                            .allContacts[index]
                            .name,
                        style: TextStyle(fontSize: 20),
                      ),
                      leading: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 15),
                      ),
                      subtitle: Text(
                          Provider.of<ContactProvider>(context, listen: false)
                              .allContacts[index]
                              .phone),
                      onTap: () {
                        Navigator.of(context).pushNamed("detail_page",
                            arguments: contacts[index]);
                      },
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add, size: 40),
              onPressed: () {
                Navigator.pushNamed(context, 'add');
              }));
    }
  }
}
