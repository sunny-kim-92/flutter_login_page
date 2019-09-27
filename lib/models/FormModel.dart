import 'package:flutter/material.dart';

class FormModel with ChangeNotifier {
  String _packageType = '';
  int _height = null;
  int _width = null;
  int _length = null;
  int _weight = null;

  int _startAdNum = null;
  String _startAdStreet = '';
  int _startAdApNum = null;
  String _startAdCity = '';
  int _startAdZip = null;

  int _endAdNum = null;
  String _endAdStreet = '';
  int _endAdApNum = null;
  String _endAdCity = '';
  int _endAdZip = null;

  DateTime _startDate = new DateTime.now();
  DateTime _endDate = new DateTime.now().add(new Duration(milliseconds: 1));

  int _price = 0;

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

  getPageComplete1() {
    if (this._packageType != "") {
      return true;
    }
    return false;
  }

  getPageComplete2() {
    if (this._packageType == 'Container') {
      if (this._height != null &&
          this._width != null &&
          this._length != null &&
          this._weight != null) {
        return true;
      }
      return false;
    } else {
      if (this._weight != null) {
        return true;
      }
      return false;
    }
  }

  getPageComplete3() {
    if (this._startAdCity != null &&
        this._startAdNum != null &&
        this._startAdStreet != null &&
        this._startAdZip != null) {
      return true;
    }
    return false;
  }

  getPageComplete4() {
    if (this._endAdCity != null &&
        this._endAdNum != null &&
        this._endAdStreet != null &&
        this._endAdZip != null) {
      return true;
    }
    return false;
  }

  getPageComplete5() {
    if (this._startDate != null && this._endDate != null) {
      return true;
    }
    return false;
  }

  getPackageType() => _packageType;
  getWeight() => _weight;
  getHeight() => _height;
  getWidth() => _width;
  getLength() => _length;

  getStartAdNum() => _startAdNum;
  getStartAdStreet() => _startAdStreet;
  getStartAdApNum() => _startAdApNum;
  getStartAdCity() => _startAdCity;
  getStartAdZip() => _startAdZip;

  getEndAdNum() => _endAdNum;
  getEndAdStreet() => _endAdStreet;
  getEndAdApNum() => _endAdApNum;

  getEndAdCity() => _endAdCity;
  getEndAdZip() => _endAdZip;

  getStartDate() => _startDate;
  getEndDate() => _endDate;

  getPrice() => _price;

  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    notifyListeners();
  }

  void setPackageType(String str) {
    _packageType = str;
    notifyListeners();
  }

  void setStartAdNum(int n) {
    _startAdNum = n;
  }

  void setStartAdStreet(String str) {
    _startAdStreet = str;
  }

  void setStartAdApNum(int n) {
    _startAdApNum = n;
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

  void setEndAdApNum(int n) {
    _endAdApNum = n;
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

  String dateValidate() {
    if (_endDate == null) {
      return "Shipments require a minimum of 1 day between pickup and dropoff. Please select a new pickup and/or dropoff date";
    } else if (_endDate.difference(_startDate).inDays < 1) {
      return "Shipments require a minimum of 1 day between pickup and dropoff. Please select a new pickup and/or dropoff date";
    } else {
      return 'good';
    }
  }
}
