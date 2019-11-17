import 'package:flutter/material.dart';

class ListSpinner extends StatelessWidget {
  ListSpinner({
    Key key,
    this.loading,
  }) : super(key: key);

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return new Opacity(
        opacity: loading ? 1.0 : 0.0,
        child: new Center(
          child: new Container(
            margin: const EdgeInsets.only(top: 8.0),
            width: 32.0,
            height: 32.0,
            child: const CircularProgressIndicator(),
          ),
        ));
  }
}
