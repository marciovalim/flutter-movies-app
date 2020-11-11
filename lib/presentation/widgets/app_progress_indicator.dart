import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
