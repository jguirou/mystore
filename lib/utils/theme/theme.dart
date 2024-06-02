import 'package:flutter/material.dart';
import 'package:mystore/utils/theme/custom_theme/appbar_theme.dart';
import 'package:mystore/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:mystore/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:mystore/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:mystore/utils/theme/custom_theme/outline_button_theme.dart';
import 'package:mystore/utils/theme/custom_theme/text_field_theme.dart';
import 'package:mystore/utils/theme/custom_theme/text_theme.dart';

import 'custom_theme/chip_theme.dart';

class AppTheme {
  AppTheme._();

  /// light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyStoreTextTheme.lightTextTheme,
    elevatedButtonTheme: MyStoreElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MyStoreAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: MyStoreBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: MyStoreCheckBoxTheme.lightCheckboxThemeData,
    outlinedButtonTheme: MyStoreOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: MyStoreTextFieldTheme.lightTextFieldTheme,
    chipTheme: MyStoreChipTheme.lightChipThemeData,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyStoreTextTheme.darkTextTheme,

    elevatedButtonTheme: MyStoreElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MyStoreAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: MyStoreBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: MyStoreCheckBoxTheme.darkCheckboxThemeData,
    outlinedButtonTheme: MyStoreOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: MyStoreTextFieldTheme.darkTextFieldTheme,
    chipTheme: MyStoreChipTheme.darkChipThemeData,


  );
}