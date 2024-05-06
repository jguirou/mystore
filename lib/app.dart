import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mystore/bindings/general_bindings.dart';
import 'package:mystore/presentation/on_boarding/ui/screen/on_boarding_screen.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show loader or circullar progress indicator meanwhile authentication repository is deciding to show relevant screen
      home: const Scaffold(backgroundColor: AppColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),)
    );
  }
}