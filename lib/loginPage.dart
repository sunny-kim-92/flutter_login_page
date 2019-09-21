import 'package:flutter/material.dart';
import 'package:login_fun/models/FormModel.dart';
import 'package:validators/validators.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';

import './models/PageOne.dart';
import './models/PageTwo.dart';
import './stepperOrigin.dart';
import './stepperDates.dart';

import 'AdRadio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pageOneKey = GlobalKey<FormState>();
  final _pageTwoKey = GlobalKey<FormState>();
  final _pageOne = PageOne();
  final _pageTwo = PageTwo();

  final _totalDots = 7;
  int _currentPosition = 0;

  int _validPosition(int position) {
    if (position >= _totalDots) return _totalDots - 1;
    if (position < 0) return 0;
    return position;
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  ScrollController c;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text('Shipment Details')),
        body: Column(children: <Widget>[
          Flexible(
              child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: <Widget>[
                AdRadio(),
                StepperDate(),
                StepperBody(),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Builder(
                        builder: (context) => Form(
                            key: _pageOneKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    initialValue: Provider.of<FormModel>(context, listen: false).getStartAdStreet(),
                                    decoration: InputDecoration(
                                        labelText: 'Street Name'),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter a valid street name';
                                      }
                                      if (isInt(value)) {
                                        return 'That is a number';
                                      }
                                    },
                                    onSaved: (val) => setState(
                                        () => _pageOne.streetName = val),
                                  ),
                                  TextFormField(
                                      initialValue: _pageOne.city,
                                      decoration:
                                          InputDecoration(labelText: 'City'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a valid city';
                                        }
                                        if (isInt(value)) {
                                          return 'That is a number';
                                        }
                                      },
                                      onSaved: (val) =>
                                          setState(() => _pageOne.city = val)),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                    child: Text('Weight'),
                                  ),
                                  SwitchListTile(
                                      title: const Text('Overweight Shipment'),
                                      value: _pageOne.overweight,
                                      onChanged: (bool val) => setState(
                                          () => _pageOne.overweight = val)),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                    child: Text('Options'),
                                  ),
                                  CheckboxListTile(
                                      title: const Text('Big'),
                                      value: _pageOne.options[PageOne.Big],
                                      onChanged: (val) {
                                        setState(() => _pageOne
                                            .options[PageOne.Big] = val);
                                      }),
                                  CheckboxListTile(
                                      title: const Text('Heavy'),
                                      value: _pageOne.options[PageOne.Heavy],
                                      onChanged: (val) {
                                        setState(() => _pageOne
                                            .options[PageOne.Heavy] = val);
                                      }),
                                  CheckboxListTile(
                                      title: const Text('Chicken'),
                                      value: _pageOne.options[PageOne.Chicken],
                                      onChanged: (val) {
                                        setState(() => _pageOne
                                            .options[PageOne.Chicken] = val);
                                      }),
                                ])))),
                Container(
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                    child: Builder(
                        builder: (context) => Form(
                            key: _pageTwoKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: Text('Chickens'),
                                  ),
                                  SwitchListTile(
                                      title: const Text('Are you hungry?'),
                                      value: _pageTwo.hungry,
                                      onChanged: (bool val) => setState(
                                          () => _pageTwo.hungry = val)),
                                ])))),
                (Consumer<FormModel>(builder: (context, form, child) {
                  return Column(children: [
                    Text('${form.getStartAdStreet()}'),
                    FlatButton(
                        child: Text('Next'),
                        color: Colors.green,
                        onPressed: () {
                          print(form.getTest1());
                        })
                  ]);
                }))
              ])),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text('Prev'),
                  color: Colors.deepOrange,
                  onPressed: () {
                    _updatePosition(--_currentPosition);
                    _controller.previousPage(
                        duration: _kDuration, curve: _kCurve);
                  },
                ),
                DotsIndicator(
                    dotsCount: _totalDots, position: _currentPosition),
                FlatButton(
                  child: Text('Next'),
                  color: Colors.green,
                  onPressed: () {
                    _updatePosition(++_currentPosition);
                    // final form = _pageOneKey.currentState;
                    // if (form.validate()) {
                    // form.save();
                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                    // }
                  },
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          )
        ]));
  }
}
