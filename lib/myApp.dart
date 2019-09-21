import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms Demo',
      home: ChangeNotifierProvider<FormModel>(
          builder: (_) => FormModel('', null, '', '', null, null, '', '', null,
              new DateTime.now(), null, null),
          child: LoginPage()),
    );
  }
}
