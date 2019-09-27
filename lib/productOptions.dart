import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class ProductOptions extends StatefulWidget {
  static _ProductOptionsState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_ProductOptionsState>());
  @override
  _ProductOptionsState createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                title: const Text('Product Dimensions'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: Column(children: [
                  TextFormField(
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
                        labelText: 'Length (meters)',
                        hintText: 'Length (meters)',
                        //filled: true,
                        icon: const Icon(Icons.local_shipping),
                        labelStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                  ),
                  TextFormField(
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
                        labelText: 'Width (meters)',
                        hintText: 'Width (meters)',
                        //filled: true,
                        icon: const Icon(Icons.local_shipping),
                        labelStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                  ),
                  TextFormField(
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
                        labelText: 'Height (meters)',
                        hintText: 'Height (meters)',
                        //filled: true,
                        icon: const Icon(Icons.local_shipping),
                        labelStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.solid)),
                  )
                ])),
            Step(
                title: const Text('Weight'),
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
                      labelText: 'Weight (kg)',
                      hintText: 'Weight (kg)',
                      icon: const Icon(Icons.local_shipping),
                      labelStyle: TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )),
          ],
          type: StepperType.vertical,
          currentStep: this.currStep,
          onStepContinue: () {
            setState(() {
              if (currStep < 1) {
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
