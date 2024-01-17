import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobic_cover/constant/app_colors.dart';

class CommonSvgImage {
  static commonSvgImage(
      {String? imagePath,
      double? height,
      double? width,
      Color? color = AppColors.blackColor}) {
    return SvgPicture.asset(
      imagePath!,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(
        color!,
        BlendMode.srcIn,
      ),
    );
  }
}
