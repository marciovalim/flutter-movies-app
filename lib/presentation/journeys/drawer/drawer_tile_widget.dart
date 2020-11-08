import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_tile_container_widget.dart';

class DrawerTileWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color overrideColor;

  const DrawerTileWidget({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.overrideColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DrawerTileContainerWidget(
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: overrideColor ??
                      Theme.of(context).textTheme.subtitle1.color,
                ),
          ),
        ),
      ),
    );
  }
}
