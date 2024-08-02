
import 'package:flutter/material.dart';

import '../models/theme_model.dart';

class thememodelprovider with ChangeNotifier{

  thememodel themeModel = thememodel(isThemeDark: false);

  void theme(){
    themeModel.isThemeDark = !themeModel.isThemeDark;
    notifyListeners();
  }
}