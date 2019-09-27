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
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formInfo = Provider.of<FormModel>(context);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Builder(
            builder: (context) => Form(
                    child: Column(
                      crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text('Weight',
                    style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child:
                  TextFormField(
                    initialValue: Provider.of<FormModel>(context, listen: false)
                        .getWeight(),
                    decoration: InputDecoration(labelText: 'Weight'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid street name';
                      }
                    },
                    onSaved: (val) => {},
                  )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Text('Options'),
                  ),
                ]))));
  }
}
