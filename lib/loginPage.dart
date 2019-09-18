import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import './models/PageOne.dart';
import './models/PageTwo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pageOneKey = GlobalKey<FormState>();
  final _pageTwoKey = GlobalKey<FormState>();
  final _pageOne = PageOne();
  final _pageTwo = PageTwo();

  ScrollController c;

  void initState() {
    super.initState();
  }

  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text('Profile')),
        body: Column(children: <Widget>[
          Flexible(
              child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: <Widget>[
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Builder(
                        builder: (context) => Form(
                            key: _pageOneKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    initialValue: _pageOne.streetName,
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
                                      decoration: InputDecoration(
                                          labelText: 'City'),
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
                                      value: _pageOne.newsletter,
                                      onChanged: (bool val) => setState(
                                          () => _pageOne.newsletter = val)),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Builder(
                        builder: (context) => Form(
                            key: _pageTwoKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                    child: Text('Chickens'),
                                  ),
                                  SwitchListTile(
                                      title: const Text('Are you hungry?'),
                                      value: _pageTwo.hungry,
                                      onChanged: (bool val) => setState(
                                          () => _pageTwo.hungry = val)),
                                ])))),
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
                    _controller.previousPage(
                        duration: _kDuration, curve: _kCurve);
                  },
                ),
                FlatButton(
                  child: Text('Next'),
                  color: Colors.green,
                  onPressed: () {
                    final form = _pageOneKey.currentState;
                    if (form.validate()) {
                      form.save();
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);
                    }
                    else {

                    }
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

  _showSuccess(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Saving...')));
  }
}
