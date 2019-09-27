import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/FormModel.dart';

class ApiPage extends StatelessWidget {

  ApiPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formInfo = Provider.of<FormModel>(context);
    print('we here');
    return Center(
          child: FutureBuilder<Post>(
            future: formInfo.fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        );
  }
}