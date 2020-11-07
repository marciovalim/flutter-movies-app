import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_tile_container_widget.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_tile_widget.dart';

class DrawerTileExpansionWidget extends StatelessWidget {
  final String title;
  final List<DrawerNestedTile> nestedTiles;

  const DrawerTileExpansionWidget({
    Key key,
    @required this.title,
    @required this.nestedTiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerTileContainerWidget(
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: nestedTiles.map((tile) {
          return Padding(
            padding: EdgeInsets.only(left: Sizes.s32.w),
            child: DrawerTileWidget(
              title: tile.title,
              onPressed: tile.onPressed,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DrawerNestedTile {
  final String title;
  final Function onPressed;

  const DrawerNestedTile({@required this.title, @required this.onPressed});
}
