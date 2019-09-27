import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class StepperDestination extends StatefulWidget {
  static _StepperDestinationState of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_StepperDestinationState>());
  @override
  _StepperDestinationState createState() => _StepperDestinationState();
}

class _StepperDestinationState extends State<StepperDestination> {
  int currStep = 0;
  static var _focusNode = FocusNode();

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
      child: ListView(children: <Widget>[
        Stepper(
          steps: [
            Step(
                title: const Text('Destination Street Number'),
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
                  validator: (val) {
                    if (val.isEmpty || val.length < 1) {
                      return 'Please enter a valid address number';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Address number',
                      hintText: 'Address number',
                      //filled: true,
                      icon: const Icon(Icons.home),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Destination Street Name'),
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
                      labelText: 'Enter the Destination street name',
                      hintText: 'Enter the Destination street name',
                      icon: const Icon(Icons.home),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
                Step(
                title: const Text('Destination Apartment / PO Box'),
                //subtitle: const Text('Subtitle'),
                isActive: true,
                //state: StepState.editing,
                state: StepState.indexed,
                content: TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  onSaved: (String val) {
                    var endAdApNum = int.parse(val);
                    formInfo.setEndAdApNum(endAdApNum);
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'Not Required',
                      hintText: 'Not Required',
                      icon: const Icon(Icons.home),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Destination City'),
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
                      labelText: 'Enter Destination city',
                      hintText: 'Enter Destination city',
                      icon: const Icon(Icons.home),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Destination Zip Code'),
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
                      labelText: 'Enter Destination zip code',
                      hintText: 'Enter Destination zip code',
                      icon: const Icon(Icons.home),
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
        )
      ]),
    ));
  }
}
