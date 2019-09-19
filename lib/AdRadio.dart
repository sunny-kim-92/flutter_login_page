import 'package:custom_radio/custom_radio.dart';
import 'package:flutter/material.dart';

class AdRadio extends StatefulWidget {
  AdRadio({Key key}) : super(key: key);

  @override
  State<AdRadio> createState() => _AdRadioState();
}

class _AdRadioState extends State<AdRadio> with SingleTickerProviderStateMixin {
  _AdRadioState() {
    dynamicBuilder = (BuildContext context, List<dynamic> animValues,
        Function updateState, String value) {
      return GestureDetector(
          onTap: () {
            setState(() {
              _radioValue = value;
            });
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
              padding: EdgeInsets.all(32.0 + animValues[0] * 12.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: animValues[1],
                // border: Border.all(
                //   color: animValues[2],
                //   width: 2.0
                // )
              ),
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontSize: 20.0, color: animValues[2]),
              )));
    };
  }

  RadioBuilder<String, dynamic> dynamicBuilder;

  // AnimationController _controller;

  String _radioValue;

  @override
  void initState() {
    super.initState();
    _radioValue = '';
    // _controller =
    //     AnimationController(duration: Duration(milliseconds: 50), vsync: this);
    // _controller.addListener(() {
    //   setState(() {});
    // });
  }

  // @override
  // void dispose() {
  //   _controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Please select an option'),
      Flexible(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            CustomRadio<String, dynamic>(
              value: 'Container',
              groupValue: _radioValue,
              animsBuilder: (AnimationController controller) => [
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
                ColorTween(begin: Colors.white, end: Colors.deepOrange)
                    .animate(controller),
                ColorTween(begin: Colors.deepOrange, end: Colors.white)
                    .animate(controller),
              ],
              builder: dynamicBuilder,
            ),
            CustomRadio<String, dynamic>(
              value: 'Commodity',
              groupValue: _radioValue,
              animsBuilder: (AnimationController controller) => [
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
                ColorTween(begin: Colors.white, end: Colors.deepOrange)
                    .animate(controller),
                ColorTween(begin: Colors.deepOrange, end: Colors.white)
                    .animate(controller),
              ],
              builder: dynamicBuilder,
            ),
            CustomRadio<String, dynamic>(
              value: 'Chicken',
              groupValue: _radioValue,
              animsBuilder: (AnimationController controller) => [
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
                ColorTween(begin: Colors.white, end: Colors.deepOrange)
                    .animate(controller),
                ColorTween(begin: Colors.deepOrange, end: Colors.white)
                    .animate(controller),
              ],
              builder: dynamicBuilder,
            ),
          ]))
    ]);
  }
}
