import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:responsive_size/responsive_size.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ResponsiveSize.statusBarHeight + Sizes.s4.h,
        left: Sizes.s16.w,
        right: Sizes.s16.w,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.s12.h,
            ),
          ),
          Expanded(
            child: AppLogo(
              height: Sizes.s14.h,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.s12.h,
            ),
          ),
        ],
      ),
    );
  }
}
