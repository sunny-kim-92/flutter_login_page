import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';
import './stepper.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Steppers'),
          ),
          body: new StepperBody(),
        ));
  }
}
