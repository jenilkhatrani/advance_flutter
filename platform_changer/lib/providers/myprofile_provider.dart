import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/myprofile_model.dart';

class MyprofileProvider with ChangeNotifier {
  MyProfileModel _myProfileModel = MyProfileModel(
    myname: '',
    myphone: '',
    gender: '',
    email:'',
    image: ''
  );

  MyProfileModel get myProfileModel => _myProfileModel;

  void UpdateProfile(String myname, String myphone, String gender, String email, String image){
    _myProfileModel = MyProfileModel(
        myname: myname,
        myphone: myphone,
        gender: gender,
        email: email,
        image: image
    );
    notifyListeners();
  }
}
