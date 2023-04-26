import 'package:flutter/material.dart';
import 'package:ieeewie/core/themes/i_theme_data.dart';


ThemeData getThemeData(IThemeData theme) {

  return ThemeData.from(
    colorScheme: theme.colorScheme,
    textTheme: theme.textTheme,
  ).copyWith(
    scaffoldBackgroundColor: theme.backgroundColor,
    iconTheme: theme.iconTheme,
    primaryIconTheme: theme.iconTheme,
    elevatedButtonTheme: theme.elevatedButtonTheme,
    dividerTheme: theme.dividerTheme,
    dividerColor: theme.dividerColor,
    cardTheme: theme.cardTheme,
    extensions: {
      theme.appThemeData
    },
  );
}
