import 'package:flutter/cupertino.dart';
import 'package:mirror_wall/model/bookmarkmodel.dart';


class Bookmarkprovider with ChangeNotifier{
  List<Bookmarkmodel> bookmarks = [];

  void AddToBookMark({required Bookmarkmodel data}){
    bookmarks.add(data);
    notifyListeners();
  }
}