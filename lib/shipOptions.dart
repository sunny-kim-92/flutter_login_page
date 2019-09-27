// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import './models/FormModel.dart';

// class ShipOptions extends StatefulWidget {
//   @override
//   _ShipOptionsState createState() => _ShipOptionsState();
// }

// class _ShipOptionsState extends State<ShipOptions> {

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formInfo = Provider.of<FormModel>(context);

//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16, vertical: 16),
//         child: Builder(
//           builder: (context) => Form(
//             child: Column(
//                 crossAxisAlignment:
//                     CrossAxisAlignment.stretch,
//                 children: [
//               TextFormField(
//                 initialValue: Provider.of<FormModel>(
//                         context,
//                         listen: false)
//                     .getStartAdStreet(),
//                 decoration: InputDecoration(
//                     labelText: 'Street Name'),
//                 validator: (value) {
//                 },
//               TextFormField(
//                   initialValue: _pageOne.city,
//                   decoration:
//                       InputDecoration(labelText: 'City'),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter a valid city';
//                     }
//                     if (isInt(value)) {
//                       return 'That is a number';
//                     }
//                   },
//                   onSaved: (val) =>
//                       setState(() => _pageOne.city = val)),
//               Container(
//                 padding:
//                     const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                 child: Text('Weight'),
//               ),
//               SwitchListTile(
//                   title: const Text('Overweight Shipment'),
//                   value: _pageOne.overweight,
//                   onChanged: (bool val) => setState(
//                       () => _pageOne.overweight = val)),
//               Container(
//                 padding:
//                     const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                 child: Text('Options'),
//               ),
//               CheckboxListTile(
//                   title: const Text('Big'),
//                   value: _pageOne.options[PageOne.Big],
//                   onChanged: (val) {
//                     setState(() => _pageOne
//                         .options[PageOne.Big] = val);
//                   }),
//               CheckboxListTile(
//                   title: const Text('Heavy'),
//                   value: _pageOne.options[PageOne.Heavy],
//                   onChanged: (val) {
//                     setState(() => _pageOne
//                         .options[PageOne.Heavy] = val);
//                   }),
//               CheckboxListTile(
//                   title: const Text('Chicken'),
//                   value: _pageOne.options[PageOne.Chicken],
//                   onChanged: (val) {
//                     setState(() => _pageOne
//                         .options[PageOne.Chicken] = val);
//                   }),
//             ]))));
//   }
// }
