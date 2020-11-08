import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/translation_keys.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/presentation/journeys/drawer/drawer_tile_widget.dart';
import 'package:movies_app/presentation/journeys/drawer/drawer_tile_expansion_widget.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:movies_app/common/constants/size_constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.s300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.s8.h,
                bottom: Sizes.s18.h,
                left: Sizes.s8.w,
                right: Sizes.s8.w,
              ),
              child: AppLogo(height: Sizes.s20.h),
            ),
            DrawerTileWidget(
              title: TranslationKeys.favoriteMovies.translate(context),
              onPressed: () {},
            ),
            DrawerTileExpansionWidget(
              title: TranslationKeys.language.translate(context),
              nestedTiles: [
                DrawerNestedTile(
                  title: 'English',
                  onPressed: () {},
                ),
                DrawerNestedTile(
                  title: 'Português',
                  onPressed: () {},
                ),
              ],
            ),
            DrawerTileWidget(
              title: TranslationKeys.feedback.translate(context),
              onPressed: () {},
            ),
            DrawerTileWidget(
              title: TranslationKeys.about.translate(context),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
