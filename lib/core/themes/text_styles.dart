import 'package:flutter/material.dart';

//* ######################## App TextStyles #########################

mixin TextStyles {
  static const fontFamily = 'Tajawal';
  static const fontLineHeightMultiplier = 1.8;

  static const displayLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 18 med
  static const displayMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 17 reg
  static const displaySmall = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 16 med
  static const headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 16 reg
  static const headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 14 med
  static const titleLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 14 reg
  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 12 bold
  static const titleSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 12 med
  static const bodyLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 12 reg
  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 10 med
  static const labelLarge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 10 reg
  static const bodySmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );

  /// 11 reg
  static const labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    textBaseline: TextBaseline.ideographic,
    fontFamily: fontFamily,
    height: fontLineHeightMultiplier,
  );
}
