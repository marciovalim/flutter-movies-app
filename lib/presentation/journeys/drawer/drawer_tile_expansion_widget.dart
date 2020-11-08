import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_tile_container_widget.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_tile_widget.dart';

class DrawerTileExpansionWidget extends StatefulWidget {
  final String title;
  final List<DrawerNestedTile> nestedTiles;
  final int initialSelectedIndex;

  const DrawerTileExpansionWidget({
    Key key,
    @required this.title,
    @required this.nestedTiles,
    @required this.initialSelectedIndex,
  })  : assert(initialSelectedIndex != null),
        assert(initialSelectedIndex < nestedTiles.length),
        assert(initialSelectedIndex >= 0),
        super(key: key);

  @override
  _DrawerTileExpansionWidgetState createState() =>
      _DrawerTileExpansionWidgetState();
}

class _DrawerTileExpansionWidgetState extends State<DrawerTileExpansionWidget> {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return DrawerTileContainerWidget(
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: List.generate(widget.nestedTiles.length, (index) {
          return _DrawerNestedTileWidget(
            index: index,
            tile: widget.nestedTiles[index],
            isSelected: _selectedIndex == index,
            onSelected: (selectedIndex) {
              setState(() => _selectedIndex = selectedIndex);
            },
          );
        }),
      ),
    );
  }
}

class _DrawerNestedTileWidget extends StatelessWidget {
  final DrawerNestedTile tile;
  final int index;
  final Function(int) onSelected;
  final bool isSelected;

  const _DrawerNestedTileWidget({
    Key key,
    @required this.tile,
    @required this.isSelected,
    @required this.onSelected,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sizes.s32.w),
      child: DrawerTileWidget(
        title: tile.title,
        onPressed: () {
          onSelected?.call(index);
          tile.onPressed?.call();
        },
        overrideColor: isSelected ? Theme.of(context).accentColor : null,
      ),
    );
  }
}

class DrawerNestedTile {
  final String title;
  final Function onPressed;

  const DrawerNestedTile({@required this.title, @required this.onPressed});
}
