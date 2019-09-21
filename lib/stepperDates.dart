import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

import 'package:table_calendar/table_calendar.dart';

class StepperDate extends StatefulWidget {
  @override
  _StepperDateState createState() => _StepperDateState();
}

class _StepperDateState extends State<StepperDate> {
  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
      _calendarController = CalendarController();
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
                title: const Text('Pick Up Date'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: TableCalendar(
                  calendarController: _calendarController,
                )),
            Step(
                title: const Text('Drop Off Date'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: TableCalendar(
                  calendarController: _calendarController,
                ))
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
