import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: ChangeNotifierProvider<FormModel>(
          builder: (_) => FormModel('', null, '', '', null, null, '', '', null,
              new DateTime.now(), null, null),
          child: LoginPage()),
        );
  }
}
