import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier{
  int _newRecordType  = 0;
  int get newRecordType{
    return _newRecordType + 0;
  }

  void changeNewType(int newType){
    _newRecordType = newType;
    notifyListeners();
  }
}