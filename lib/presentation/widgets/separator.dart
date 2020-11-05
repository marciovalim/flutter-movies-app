import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:responsive_size/responsive_size_ext.dart';

import 'package:movies_app/common/constants/size_constants.dart';

class Separator extends StatelessWidget {
  const Separator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.s80.w,
      height: Sizes.s1.h,
      padding: EdgeInsets.only(
        top: Sizes.s2.h,
        bottom: Sizes.s6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.s1.w),
        gradient: LinearGradient(
          colors: [
            AppColors.violet,
            AppColors.royalBlue,
          ],
        ),
      ),
    );
  }
}
