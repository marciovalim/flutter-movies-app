import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';

class TextThemes {
  const TextThemes._();

  static getTextTheme() {
    return TextTheme(
      headline6: _whiteHeadLine6,
    );
  }

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadLine6 {
    return _poppinsTextTheme.headline6.copyWith(
      fontSize: Sizes.s20.w,
      color: Colors.white,
    );
  }
}
