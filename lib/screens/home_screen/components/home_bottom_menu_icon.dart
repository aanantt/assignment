 import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/app_consts.dart';

BottomNavigationBarItem homeBottomMenuIcon({
    final int itemIndex,
    final int currentIndex,
    final String title,
    final String svgPic,
}) {
  return BottomNavigationBarItem(
    label: title,
    icon: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SvgPicture.asset(
        svgPic,
        height: 22,
        width: 22,
        color: currentIndex == itemIndex
            ? AppColors.darkGrey
            : AppColors.lightGrey,
      ),
    ),
  );
}
