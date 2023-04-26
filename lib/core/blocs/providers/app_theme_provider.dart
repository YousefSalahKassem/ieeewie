import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/helpers/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<AppThemeProvider>(
    (ref) => AppThemeProvider(),
  );


  ThemeFlavor _themeFlavor = ThemeFlavor.dark;

  ThemeFlavor get themeFlavor => _themeFlavor;

  bool get isDarkTheme => _themeFlavor == ThemeFlavor.dark;

  AppThemeProvider();

  Future<void> setThemeFlavor(ThemeFlavor flavor) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _themeFlavor = flavor;
    sharedPreferences.setInt("theme", flavor.index);
    notifyListeners();
  }

  Future<void> load() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final int? userFlavor = sharedPreferences.getInt("theme");
    setThemeFlavor(ThemeFlavor.values[userFlavor ?? ThemeFlavor.dark.index]);
  }
}
