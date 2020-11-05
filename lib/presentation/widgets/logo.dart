import 'package:flutter/material.dart';

import 'package:responsive_size/responsive_size.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key key,
    @required this.height,
  })  : assert(height != null, 'height should not be null'),
        assert(height > 0, 'height should be greater than zero'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
