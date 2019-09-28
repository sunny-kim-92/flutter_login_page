import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class StepperOrigin extends StatefulWidget {
  static _StepperOriginState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_StepperOriginState>());
  @override
  _StepperOriginState createState() => _StepperOriginState();
}

class _StepperOriginState extends State<StepperOrigin> {
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

                  decoration: InputDecoration(
                      labelText: 'Address number',
                      hintText: 'Address number',
                      //filled: true,
                      icon: const Icon(Icons.home),
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
                  onSaved: (String val) {
                    formInfo.setStartAdStreet(val);
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'Enter the origin street name',
                      hintText: 'Enter the origin street name',
                      icon: const Icon(Icons.home),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
            Step(
                title: const Text('Origin Apartment / PO Box'),
                //subtitle: const Text('Subtitle'),
                isActive: true,
                //state: StepState.editing,
                state: StepState.indexed,
                content: TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  onSaved: (String val) {
                    var startAdApNum = int.parse(val);
                    formInfo.setStartAdApNum(startAdApNum);
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
                title: const Text('Origin City'),
                // subtitle: const Text('Subtitle'),
                isActive: true,
                state: StepState.indexed,
                content: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onSaved: (String val) {
                    formInfo.setStartAdCity(val);
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'Enter origin city',
                      hintText: 'Enter origin city',
                      icon: const Icon(Icons.home),
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
                  maxLines: 1,
                  onSaved: (String val) {
                    var startAdZip = int.parse(val);
                    formInfo.setStartAdZip(startAdZip);
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter origin zip code',
                      hintText: 'Enter origin zip code',
                      icon: const Icon(Icons.home),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
          ],
          type: StepperType.vertical,
          currentStep: this.currStep,
          onStepContinue: () {
            setState(() {
              if (currStep < 4) {
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
