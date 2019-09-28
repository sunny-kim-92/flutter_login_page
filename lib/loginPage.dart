import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';

import './models/FormModel.dart';
import 'stepperDestination.dart';
import './stepperOrigin.dart';
import './stepperDates.dart';
// import './productOptions.dart';
import './testPOps.dart';
import './AdRadio.dart';
import './ApiPage.dart';
import './models/PageOne.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pageOne = PageOne();

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
    final formInfo = Provider.of<FormModel>(context);

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
                StepperOrigin(),
                StepperDestination(),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Builder(
                        builder: (context) => Form(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                    child: Text('Options'),
                                  ),
                                  SwitchListTile(
                                      title: const Text('Oversize Shipment'),
                                      value: _pageOne.oversize,
                                      onChanged: (bool val) {
                                        setState(() {
                                          _pageOne.oversize = val;
                                        });
                                        formInfo.setOversize(val);
                                      }),
                                  SwitchListTile(
                                      title: const Text(
                                          'Refridgerated Transport Required'),
                                      value: _pageOne.refridgerated,
                                      onChanged: (bool val) {
                                        setState(() {
                                          _pageOne.refridgerated = val;
                                        });
                                        formInfo.setRefridgerated(val);
                                      }),
                                  CheckboxListTile(
                                      title: const Text(
                                          'Do you believe in life after love?'),
                                      value: _pageOne.cher,
                                      onChanged: (bool val) {
                                        setState(() {
                                          _pageOne.cher = val;
                                        });
                                        print(formInfo.getCher());
                                        formInfo.setCher(val);
                                        if (val == true) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text("!!"),
                                                  content: Text(
                                                      'I can feeeeeeel somethiiiiiiing insiiiiiiiiide me saaay!'),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('Cher'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        }
                                      }),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                    child: Text('Notes'),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    initialValue: Provider.of<FormModel>(
                                            context,
                                            listen: false)
                                        .getNotes(),
                                    decoration: InputDecoration(
                                        labelText: 'Additional Notes'),
                                    onSaved: (val) {
                                      formInfo.setNotes(val);
                                    },
                                  )
                                ])))),
                ApiPage(),
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
                Consumer<FormModel>(builder: (context, form, child) {
                  return FlatButton(
                    child: Text('Next'),
                    color: Colors.green,
                    onPressed: () {
                      print(form.getStartDate());
                      print(form.getEndDate());
                      if (_currentPosition == 0) {
                        _updatePosition(++_currentPosition);
                        _controller.nextPage(
                            duration: _kDuration, curve: _kCurve);
                      } else if (_currentPosition == 1) {
                        if (form.dateValidate() == false) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Shipment Date Error"),
                                  content: Text(
                                      'Shipments require a minimum of 1 day between pickup and dropoff. Please select a new pickup and/or dropoff date'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          _updatePosition(++_currentPosition);
                          _controller.nextPage(
                              duration: _kDuration, curve: _kCurve);
                        }
                      } else if (_currentPosition == 2) {
                        if (form.originValidate() != []) {
                          var oEString = '';
                          form.originValidate().forEach((val) {
                            if (val == 1) {
                              oEString +=
                                  "Please provide a valid address number.\n\n";
                            }
                            if (val == 2) {
                              oEString +=
                                  "Please provide a valid street name.\n\n";
                            }
                            if (val == 3) {
                              oEString +=
                                  "Please provide a valid city name.\n\n";
                            }
                            if (val == 4) {
                              oEString += "Please provide a valid zip code.";
                            }
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Address Error"),
                                  content: Text(oEString),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }
                      else if (_currentPosition == 3) {
                        if (form.destinationValidate() != []) {
                          var dEString = '';
                          form.destinationValidate().forEach((val) {
                            if (val == 1) {
                              dEString +=
                                  "Please provide a valid address number.\n\n";
                            }
                            if (val == 2) {
                              dEString +=
                                  "Please provide a valid street name.\n\n";
                            }
                            if (val == 3) {
                              dEString +=
                                  "Please provide a valid city name.\n\n";
                            }
                            if (val == 4) {
                              dEString += "Please provide a valid zip code.";
                            }
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Address Error"),
                                  content: Text(dEString),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }
                      else {
                        _updatePosition(++_currentPosition);
                        _controller.nextPage(
                            duration: _kDuration, curve: _kCurve);
                      }
                    },
                  );
                })
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
