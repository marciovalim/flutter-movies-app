import 'package:flutter/material.dart';

class DrawerTileContainerWidget extends StatelessWidget {
  final Widget child;
  final Color overrideColor;

  const DrawerTileContainerWidget({
    Key key,
    this.child,
    this.overrideColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: overrideColor ??
                Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
