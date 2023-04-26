import 'package:flutter/material.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/core/themes/data.dart';
import 'package:ieeewie/core/themes/text_styles.dart';

abstract class IThemeData {
  Color get backgroundColor;

  Color get textColor;

  ColorScheme get colorScheme;

  TextStyle get headlineTextStyle;

  TextTheme get textTheme;

  AppThemeData get appThemeData;

  IconThemeData get iconTheme;

  ElevatedButtonThemeData get elevatedButtonTheme;

  DividerThemeData get dividerTheme;

  CardTheme get cardTheme;

  Color get dividerColor;
}

class LightThemeData implements IThemeData {
  @override
  Color get backgroundColor => Colors.white;

  @override
  Color get textColor => Colors.black;

  @override
  TextStyle get headlineTextStyle =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor);

  @override
  ColorScheme get colorScheme => ColorScheme.fromSwatch(
        primarySwatch: Colors.teal,
        cardColor: Colors.white,
        errorColor: Colors.red,
        backgroundColor: backgroundColor,
        primaryColorDark: Colors.white,
        accentColor: Colors.white,
      );

  @override
  TextTheme get textTheme => const TextTheme(
        displayLarge: TextStyles.displayLarge,
        displayMedium: TextStyles.displayMedium,
        displaySmall: TextStyles.displaySmall,
        headlineMedium: TextStyles.headlineMedium,
        headlineSmall: TextStyles.headlineSmall,
        titleLarge: TextStyles.titleLarge,
        titleMedium: TextStyles.titleMedium,
        titleSmall: TextStyles.titleSmall,
        bodyLarge: TextStyles.bodyLarge,
        bodyMedium: TextStyles.bodyMedium,
        labelSmall: TextStyles.labelSmall,
        bodySmall: TextStyles.bodySmall,
        labelLarge: TextStyles.labelLarge,
      ).apply(
        fontFamily: TextStyles.fontFamily,
        displayColor: textColor,
      );


  @override
  IconThemeData get iconTheme => const IconThemeData(color: AppColors.darkGreyColor);

  @override
  // TODO: implement elevatedButtonTheme
  ElevatedButtonThemeData get elevatedButtonTheme => throw UnimplementedError();

  @override
  AppThemeData get appThemeData => const AppThemeData();

  @override
  DividerThemeData get dividerTheme => const DividerThemeData(
    color: AppColors.dividerDarkColor,
    thickness: 1,
  );

  @override
  Color get dividerColor => AppColors.dividerDarkColor;

  @override
  // TODO: implement cardTheme
  CardTheme get cardTheme => throw UnimplementedError();
}

class DarkThemeData implements IThemeData {
  @override
  Color get backgroundColor => AppColors.darkBackground;

  @override
  Color get textColor => Colors.white;

  @override
  TextStyle get headlineTextStyle =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor);

  @override
  ColorScheme get colorScheme => ColorScheme.fromSwatch(
        primarySwatch: Colors.teal,
        cardColor: Colors.white,
        errorColor: Colors.red,
        backgroundColor: backgroundColor,
        primaryColorDark: Colors.white,
        accentColor: Colors.white,
      );

  @override
  TextTheme get textTheme => const TextTheme(
        displayLarge: TextStyles.displayLarge,
        displayMedium: TextStyles.displayMedium,
        displaySmall: TextStyles.displaySmall,
        headlineMedium: TextStyles.headlineMedium,
        headlineSmall: TextStyles.headlineSmall,
        titleLarge: TextStyles.titleLarge,
        titleMedium: TextStyles.titleMedium,
        titleSmall: TextStyles.titleSmall,
        bodyLarge: TextStyles.bodyLarge,
        bodyMedium: TextStyles.bodyMedium,
        labelSmall: TextStyles.labelSmall,
        bodySmall: TextStyles.bodySmall,
        labelLarge: TextStyles.labelLarge,
      ).apply(
        fontFamily: 'Tajawal',
        displayColor: AppColors.darkGreyColor,
        bodyColor: AppColors.darkGreyColor,
        decorationColor: AppColors.white,
      );



  @override
  IconThemeData get iconTheme => const IconThemeData(color: AppColors.darkGreyColor);

  @override
  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      elevation: 2,
      foregroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Tajawal'),
    ),
  );

  @override
  AppThemeData get appThemeData => const AppThemeData();

  @override
  DividerThemeData get dividerTheme => const DividerThemeData(
    color: AppColors.dividerDarkColor,
    thickness: 1,
  );

  @override
  Color get dividerColor => AppColors.dividerDarkColor;

  @override
  // TODO: implement cardTheme
  CardTheme get cardTheme => CardTheme(
    color: AppColors.darkForeground,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
