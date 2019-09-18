class PageOne {
  static const String Big = 'Big';
  static const String Heavy = 'Heavy';
  static const String Chicken = 'Chicken';

  String streetName = '';
  String city = '';
  Map<String, bool> options = {
    Big: false,
    Heavy: false,
    Chicken: false
  };
  bool overweight = false;
}
