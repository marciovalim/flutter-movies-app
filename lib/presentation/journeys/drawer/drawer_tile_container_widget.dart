import 'package:flutter/material.dart';

class DrawerTileContainerWidget extends StatelessWidget {
  final Widget child;

  const DrawerTileContainerWidget({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
