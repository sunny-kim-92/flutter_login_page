import 'package:flutter/material.dart';
import 'loginPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms Demo',
      home: LoginPage(),
    );
  }
}