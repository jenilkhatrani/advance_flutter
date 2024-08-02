import 'package:flutter/material.dart';
import 'package:platform_changer/models/interfaceChanger_model.dart';


class interFaceChangerProvider with ChangeNotifier{

  interFaceChangerModel interfacechanger_model = interFaceChangerModel(isAndroid: false);

  void interfacechanger(){
    interfacechanger_model.isAndroid = !interfacechanger_model.isAndroid;
    notifyListeners();
  }
}