import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/providers/app_theme_provider.dart';
import 'package:ieeewie/core/helpers/enums.dart';
import 'package:ieeewie/core/themes/i_theme_data.dart' as theme;
import 'package:ieeewie/core/themes/themes.dart';

class AppTheme extends ConsumerWidget {
  final Widget Function(ThemeData theme) builder;

  const AppTheme({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeFlavor = ref.watch(AppThemeProvider.provider).themeFlavor;
    return builder(
      getThemeData(
        currentThemeFlavor == ThemeFlavor.light
            ? theme.LightThemeData()
            : theme.DarkThemeData(),
      ),
    );
  }
}
