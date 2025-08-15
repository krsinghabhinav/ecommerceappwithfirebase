import 'dart:io';

import 'package:ecommerceappwithfirebase/utils/constants/custom_colorsd.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';

class Utils {
  Utils._();
  static final storage = FirebaseStorage.instance;

  static TextFormField customTextFormField({
    String? label,
    String? hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    IconData? prefixIcon,
    Widget? suffixIcon, // <-- Change this to Widget?
    int? maxlenth,
    FormFieldValidator<String>? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxlenth,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon, // Directly assign the widget here
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      ),
    );
  }

  static Widget customButton({
    required String text,
    required VoidCallback onTap,
    double width = double.infinity,
    double height = 50,
    Color backgroundColor = CustomeColors.primary,
    Color textColor = Colors.white,
    double borderRadius = 12,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    EdgeInsets margin = EdgeInsets.zero,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }

  static Widget checkoutButton({
    required String text,
    required VoidCallback onTap,
    double width = double.infinity,
    double height = 50,
    Color backgroundColor = CustomeColors.primary,
    Color textColor = Colors.white,
    Color? iconsColor,
    double borderRadius = 12,
    double fontSize = 16,
    Icon? icon,
    FontWeight fontWeight = FontWeight.bold,
    EdgeInsets margin = EdgeInsets.zero,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Icon(Iconsax.shop, color: iconsColor),
            SizedBox(width: Get.width * 0.02),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget customText(
    String title, {
    TextStyle? style,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    double? textScaleFactor,
    TextDirection? textDirection,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    FontWeight? fontWeight,
    Color? color,
    double? fontSize,
    TextDecoration? decoration, // 👈 new parameter
  }) {
    return Text(
      title,
      style:
          style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color ?? Colors.black,
            decoration: decoration ?? TextDecoration.none, // 👈 use it
          ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      textDirection: textDirection,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  static Widget customOutlinedButton({
    required String text,
    required VoidCallback onPressed,
    double width = double.infinity,
    double height = 50,
    Color? borderColor,
    Color? textColor,
    double borderRadius = 12.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 24,
    ),
    double borderWidth = 1.5,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding,
          side: BorderSide(
            color: borderColor ?? Colors.grey,
            width: borderWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }

  static void showToast(String text, [Color? bgColor]) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      // backgroundColor: bgColor,
      backgroundColor: Colors.grey.shade900,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Widget customIcon({
    required String imagePath,
    double size = 48, // default size (width & height)
    double borderWidth = 1.0,
    Color borderColor = Colors.grey,
    Color backgroundColor = Colors.transparent,
    double borderRadius = 100, // circular by default
    BoxFit fit = BoxFit.cover,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Image.asset(imagePath, width: size, height: size, fit: fit),
    );
  }

  /// Upload file to Firebase Storage
  static Future<String?> uploadFileToFirebaseStorage(
    String filePath,
    String folder,
    String extension,
  ) async {
    try {
      var uuid = const Uuid();
      String uniqueFileName = "${uuid.v4()}.$extension";
      final path = "$folder/$uniqueFileName";
      final file = File(filePath);
      final ref = storage.ref().child(path);

      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      Utils.showToast("❌ Error uploading file: $e");
      return null;
    }
  }
}
