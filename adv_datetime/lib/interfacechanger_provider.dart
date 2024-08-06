import 'package:adv_datetime/interfacechanger_model.dart';
import 'package:flutter/cupertino.dart';

class interFaceChangerProvider with ChangeNotifier{

  interFaceChangerModel interfacechanger_model = interFaceChangerModel(isAndroid: false);

  void interfacechanger(){
    interfacechanger_model.isAndroid = !interfacechanger_model.isAndroid;

notifyListeners();
  }
}