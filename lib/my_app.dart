import 'package:ecommerceappwithfirebase/features/authentication/auth%20screen/onboarding/onboarding_screen.dart';
import 'package:ecommerceappwithfirebase/utils/themes/custome_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'depedencyinjectcongtroller/controllerinitialize.dart';
import 'splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomeTheme.lightTheme,
      darkTheme: CustomeTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: GlobalBindings(),

      home: SplashScreen(),
    );
  }
}
