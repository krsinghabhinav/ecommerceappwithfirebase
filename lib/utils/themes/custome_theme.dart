import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_appbar_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_bottom_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_checkbox_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_chip_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_eleveted_botton_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_outlined_button_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custom_text_field_theme.dart';
import 'package:ecommerceappwithfirebase/utils/themes/widgets/custome_text_theme.dart';
import 'package:flutter/material.dart';

class CustomeTheme {
  CustomeTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Nunito",
    brightness: Brightness.light,
    primaryColor: CustomeColors.primary,
    disabledColor: CustomeColors.grey,
    textTheme: CustomeTextTheme.lightTextTheme,
    scaffoldBackgroundColor: CustomeColors.white,
    chipTheme: CustomChipTheme.lightChipTheme,
    appBarTheme: CustomAppbarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevetedBottonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Nunito",
    brightness: Brightness.dark,
    primaryColor: CustomeColors.primary,
    disabledColor: CustomeColors.grey,
    textTheme: CustomeTextTheme.darkTextTheme,
    scaffoldBackgroundColor: CustomeColors.black,
    chipTheme: CustomChipTheme.darkChipTheme,
    appBarTheme: CustomAppbarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevetedBottonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
  );
}
