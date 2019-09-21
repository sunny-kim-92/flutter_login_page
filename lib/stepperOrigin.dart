import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  Widget build(BuildContext context) {
    final formInfo = Provider.of<FormModel>(context);

    return Container(
        child: Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        Stepper(
          steps: [
            Step(
                title: const Text('Origin Street Number'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: TextFormField(
                  focusNode: _focusNode,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String n) {
                    var startAdNum = int.parse(n);
                    formInfo.setStartAdNum(startAdNum);
                  },
                  maxLines: 1,
                  //initialval: 'Provider.of<FormModel>(context, listen: false).getStartAdNum()',
                  validator: (val) {
                    if (val.isEmpty || val.length < 1) {
                      return 'Please enter a valid address number';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Address number',
                      hintText: 'Address number',
                      //filled: true,
                      icon: const Icon(Icons.person),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Origin Street Name'),
                //subtitle: const Text('Subtitle'),
                isActive: true,
                //state: StepState.editing,
                state: StepState.indexed,
                content: TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter valid street name';
                    }
                  },
                  onSaved: (String val) {
                    formInfo.setStartAdStreet(val);
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'Enter the origin street name',
                      hintText: 'Enter the origin street name',
                      icon: const Icon(Icons.phone),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Origin City'),
                // subtitle: const Text('Subtitle'),
                isActive: true,
                state: StepState.indexed,
                content: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter valid city';
                    }
                  },
                  onSaved: (String val) {
                    formInfo.setStartAdCity(val);
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'Enter origin city',
                      hintText: 'Enter origin city',
                      icon: const Icon(Icons.email),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Origin Zip Code'),
                isActive: true,
                state: StepState.indexed,
                content: TextFormField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  validator: (val) {
                    if (val.isEmpty || val.length < 5) {
                      return 'Please enter valid zip code';
                    }
                  },
                  maxLines: 1,
                  onSaved: (String val) {
                    var startAdZip = int.parse(val);
                    formInfo.setStartAdZip(startAdZip);
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter origin zip code',
                      hintText: 'Enter origin zip code',
                      icon: const Icon(Icons.explicit),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
          ],
          type: StepperType.vertical,
          currentStep: this.currStep,
          onStepContinue: () {
            setState(() {
              if (currStep < 3) {
                currStep = currStep + 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currStep > 0) {
                currStep = currStep - 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              currStep = step;
            });
          },
        ),
        RaisedButton(
          child: Text(
            'Save details',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            final FormState formState = _formKey.currentState;
            formState.save();
          },
          color: Colors.blue,
        ),
      ]),
    ));
  }
}
