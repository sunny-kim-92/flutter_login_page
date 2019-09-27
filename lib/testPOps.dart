import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class ProductOptions extends StatefulWidget {
  @override
  _ProductOptionsState createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formInfo = Provider.of<FormModel>(context);
    var oversize = false;
    var refridgerated = false;
    var cher = false;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Builder(
            builder: (context) => Form(
              key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: Text('Options'),
                      ),
                      SwitchListTile(
                          title: const Text('Oversize Shipment'),
                          value: oversize,
                          onChanged: (bool val) {
                            setState(() {
                              oversize = val;
                            });
                            formInfo.setOversize(val);
                          }),
                      SwitchListTile(
                          title: const Text('Refridgerated Transport Required'),
                          value: refridgerated,
                          onChanged: (bool val) {
                            setState(() {
                              oversize = val;
                            });
                            formInfo.setRefridgerated(val);
                          }),
                      CheckboxListTile(
                          title: const Text('Do you believe in life after love?'),
                          value: cher,
                          onChanged: (bool val) {
                            setState(() {
                              oversize = val;
                            });
                            print(formInfo.getCher());
                            formInfo.setCher(val);
                            if (val == true){
                              showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("!!"),
                                  content: Text(
                                      'I can feeeeeeel somethiiiiiiing insiiiiiiiiide me saaay!'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                            }
                          }),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                        child: Text('Notes'),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        initialValue:
                          Provider.of<FormModel>(context, listen: false)
                          .getNotes(),
                        decoration:
                          InputDecoration(labelText: 'Additional Notes'),
                        onSaved: (val) {
                          formInfo.setNotes(val);
                        },
                      )
                    ]))));
  }
}
