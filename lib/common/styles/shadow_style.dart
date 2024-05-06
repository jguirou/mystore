import '../../utils/constants/colors.dart';

import 'package:flutter/material.dart';
class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 50,
      spreadRadius: 7

  );

  static final horizontalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.8),
      offset: const Offset(0, 2),
      blurRadius: 50,
      spreadRadius: 7

  );
}