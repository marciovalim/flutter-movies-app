import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/primary_button.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Widget body;

  const AppDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: Sizes.s32,
      backgroundColor: AppColors.vulcan,
      insetPadding: EdgeInsets.all(Sizes.s32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.s8.w,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.s4.h,
          left: Sizes.s16.w,
          right: Sizes.s16.w,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.vulcan,
              blurRadius: Sizes.s16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.s6.h),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            if (body != null) body,
            PrimaryButton(
              text: buttonText,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
