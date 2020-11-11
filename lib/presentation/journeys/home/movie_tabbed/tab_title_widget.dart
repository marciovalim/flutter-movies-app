import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/presentation/themes/text_themes.dart';
import 'package:movies_app/common/constants/size_constants.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isSelected;

  const TabTitleWidget({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.isSelected,
  })  : assert(onPressed != null),
        assert(isSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: EdgeInsets.only(
          top: Sizes.s4.h,
          bottom: Sizes.s6.h,
          left: Sizes.s32.w,
          right: Sizes.s32.w,
        ),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: Sizes.s1.w,
              color: isSelected ? AppColors.royalBlue : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
