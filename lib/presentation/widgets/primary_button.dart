import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const PrimaryButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.royalBlue,
              AppColors.violet,
            ],
          ),
          borderRadius: BorderRadius.circular(Sizes.s20.w),
        ),
        width: Sizes.s120.w,
        alignment: Alignment.center,
        height: Sizes.s16.h,
        padding: EdgeInsets.symmetric(horizontal: Sizes.s16.w),
        margin: EdgeInsets.symmetric(vertical: Sizes.s10.h),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
