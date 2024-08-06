import 'package:flutter/material.dart';
import 'package:mirror_wall/model/connectivityModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityProvider with ChangeNotifier{

  ConnecitivityModel connecitivityModel = ConnecitivityModel(isInternet: false);

  void checkConnectivity() {
    Connectivity connectivity = Connectivity();

    Stream<List<ConnectivityResult>> stream =
        connectivity.onConnectivityChanged;
    
    stream.listen((List<ConnectivityResult> result){
      if(result.contains(ConnectivityResult.wifi) ||
      result.contains(ConnectivityResult.mobile)){
        connecitivityModel.isInternet =true;
      }else{
        connecitivityModel.isInternet=false;
      }
      notifyListeners();
    });
  }
}