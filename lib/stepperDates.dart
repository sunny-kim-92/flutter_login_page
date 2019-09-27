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
  CalendarController _sCalendarController;
  CalendarController _eCalendarController;

  @override
  void initState() {
    super.initState();
    _eCalendarController = CalendarController();
    _sCalendarController = CalendarController();

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
                title: const Text('Pick Up Date'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: TableCalendar(
                  calendarController: _sCalendarController,
                  onDaySelected: (DateTime sDate, [dummy]) {
                    formInfo.setStartDate(sDate);
                  },
                )),
            Step(
                title: const Text('Drop Off Date'),
                //subtitle: const Text('Enter your name'),
                isActive: true,
                //state: StepState.error,
                state: StepState.indexed,
                content: TableCalendar(
                  calendarController: _eCalendarController,
                  onDaySelected: (DateTime eDate, [dummy]) {
                    print(eDate);
                    formInfo.setEndDate(eDate);
                  },
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
      ]),
    ));
  }
}
