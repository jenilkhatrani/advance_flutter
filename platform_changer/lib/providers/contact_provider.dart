import 'package:flutter/cupertino.dart';
import 'package:platform_changer/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> allContacts = [];
  List<ContactModel> hiddenContacts = [];

  void addContact({required ContactModel data}) {
    allContacts.add(data);
    notifyListeners();
  }

  void deleteContact({required ContactModel data}) {
    allContacts.remove(data);
    notifyListeners();
  }

 void UpdateContact (ContactModel UpdateContact){

    int index = allContacts.indexWhere((c) => c.phone == UpdateContact.phone);

    if(index != -1){
      allContacts[index] = UpdateContact;
    }
    notifyListeners();
 }


}
