import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';

class SpacingStyle{
  static  EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: DeviceUtils.getAppBarHeight(),
    bottom: AppSizes.defaultSpace,
    right: AppSizes.defaultSpace,
    left: AppSizes.defaultSpace,
  );
}