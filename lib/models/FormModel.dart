import 'package:flutter/material.dart';

class FormModel with ChangeNotifier {
  String _packageType = 'Container';
  int _startAdNum = null;
  String _startAdStreet = '';
  String _startAdCity = '';
  int _startAdZip = null;

  int _endAdNum = null;
  String _endAdStreet = '';
  String _endAdCity = '';
  int _endAdZip = null;

  DateTime _startDate = new DateTime.now();
  DateTime _endDate = null;

  int _price = 0;





  String _test1 = '';
  String _test2 = '';
  String _test3 = '';
  String _test4 = '';

  void setTest1(String str) {
    _test1 = str;
  }
  void setTest2(String str) {
    _test2 = str;
  }
  void setTest3(String str) {
    _test3 = str;
  }
  void setTest4(String str) {
    _test4 = str;
  }

  getTest1() => _test1;
  getTest2() => _test2;






  FormModel(
      this._packageType,
      this._startAdNum,
      this._startAdStreet,
      this._startAdCity,
      this._startAdZip,
      this._endAdNum,
      this._endAdCity,
      this._endAdStreet,
      this._endAdZip,
      this._startDate,
      this._endDate,
      this._price);

  getPackageType() => _packageType;
  getStartAdNum() => _startAdNum;
  getStartAdStreet() => _startAdStreet;
  getStartAdCity() => _startAdCity;
  getStartAdZip() => _startAdZip;

  getEndAdNum() => _endAdNum;
  getEndAdStreet() => _endAdStreet;
  getEndAdCity() => _endAdCity;
  getEndAdZip() => _endAdZip;

  getPrice() => _price;

  void setPackageType(String str) {
    _packageType = str;
  }

  void setStartAdNum(int n) {
    _startAdNum = n;
  }

  void setStartAdStreet(String str) {
    _startAdStreet = str;
  }

  void setStartAdCity(String str) {
    _startAdCity = str;
  }

  void setStartAdZip(int n) {
    _startAdZip = n;
  }

  void setEndAdNum(int n) {
    _endAdNum = n;
  }

  void setEndAdStreet(String str) {
    _endAdStreet = str;
  }

  void setEndAdCity(String str) {
    _endAdCity = str;
  }

  void setEndAdZip(int n) {
    _endAdZip = n;
  }

  void setPrice(int n) {
    _price = n;
  }
}
