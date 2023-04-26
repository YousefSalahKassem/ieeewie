import 'package:flutter/material.dart';

class AppThemeData extends ThemeExtension<AppThemeData> {

  const AppThemeData();

  @override
  ThemeExtension<AppThemeData> copyWith() {
    return this;
  }

  List<Object?> get props => [];

  @override
  ThemeExtension<AppThemeData> lerp(
      ThemeExtension<AppThemeData>? other, double t,) {
    if (other is! AppThemeData) return this;

    final normT = t.clamp(0, 1).toDouble();
    Color lerpColor(Color color1, Color color2) {
      return Color.lerp(color1, color2, normT)!;
    }

    TextStyle lerpTextStyle(TextStyle textStyle1, TextStyle textStyle2) {
      return TextStyle.lerp(textStyle1, textStyle2, normT)!;
    }

    Gradient lerpGradient(Gradient gradient1, Gradient gradient2) {
      return Gradient.lerp(gradient1, gradient2, normT)!;
    }

    return const AppThemeData(
    );
  }
}
