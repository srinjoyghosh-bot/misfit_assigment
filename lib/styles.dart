import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {

  Styles._();

  static const textPrimary = Color(0xFF191C20);
  static const textSecondary = Color(0xFF46474A);
  static const surfaceLevel = Color(0xFFF4F4F5);
  static const surfacePrimary = Color(0xFF1E7ACC);
  static const borderPrimary = Color(0xFFABABAE);

  static TextStyle headerStyle = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w500, color: textPrimary);

  static TextStyle bodyStyle = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: textPrimary);

  static TextStyle bodyStyle2 = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: textSecondary);

  static TextStyle buttonStyle = TextStyle(
      color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600);
}
