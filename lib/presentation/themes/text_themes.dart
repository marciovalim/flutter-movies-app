import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';

class TextThemes {
  const TextThemes._();

  static getTextTheme() {
    return TextTheme(
      headline6: _whiteHeadLine6,
      headline5: _whiteHeadline5,
      subtitle1: _whiteSubtitle1,
      button: _whiteButtonText,
      bodyText2: _whiteBodyText2,
    );
  }

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteButtonText => _poppinsTextTheme.button.copyWith(
        fontSize: Sizes.s14.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteSubtitle1 => _poppinsTextTheme.subtitle1.copyWith(
        color: Colors.white,
        fontSize: Sizes.s16.sp,
      );

  static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2.copyWith(
        color: Colors.white,
        fontSize: Sizes.s14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5.copyWith(
        fontSize: Sizes.s20.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteHeadLine6 {
    return _poppinsTextTheme.headline6.copyWith(
      fontSize: Sizes.s20.sp,
      color: Colors.white,
    );
  }
}

extension TextThemeExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1.copyWith(
        color: AppColors.royalBlue,
        fontWeight: FontWeight.w600,
      );
}
