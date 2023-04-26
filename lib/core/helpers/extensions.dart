import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/providers/app_theme_provider.dart';
import 'package:ieeewie/core/helpers/enums.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/features/Auth/blocs/auth_provider.dart';
import 'package:ieeewie/features/Auth/blocs/profile_notifier.dart';
import 'package:ieeewie/features/Auth/model/user.dart';

extension WidgetRefX on WidgetRef {
  void toggleThemeMode() {
    watch(AppThemeProvider.provider).isDarkTheme
        ? read(AppThemeProvider.provider.notifier)
            .setThemeFlavor(ThemeFlavor.light)
        : read(AppThemeProvider.provider.notifier)
            .setThemeFlavor(ThemeFlavor.dark);
  }

  Future<void> nextDestinationAfterSplash(BuildContext context) async {
    final destination = await _getDestination();
    switch (destination) {
      case Destination.home:
        context.router.pushAndPopUntil(const HomeRoute(),predicate: (_)=>false);
        break;
      default:
        context.router.pushAndPopUntil(const LoginRoute(),predicate: (_)=>false);
        break;
    }

  }

  Future<Destination> _getDestination() async {
    final isLoggedIn = await _isLoggedIn();

    if (isLoggedIn) {
      return Destination.home;
    } else {
      return Destination.login;
    }
  }

  Future<bool> _isLoggedIn() async {
    final authProvider = watch(AuthProvider.provider.notifier);
    return authProvider.checkIfLoggedIn();
  }

  UserModel currentUser(){
    return watch(ProfileNotifier.provider).getData()?? UserModel.empty();
  }

}

/// *** Extensions on BuildContext class *** ----------------
extension BuildContextUtils on BuildContext {
  //* MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //* Dimensions Extensions
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  Size get screenSize => MediaQuery.of(this).size;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  double get longestSide => MediaQuery.of(this).size.longestSide;

  Orientation get orientation => MediaQuery.of(this).orientation;

  double heightR(double value) => MediaQuery.of(this).size.height * value;

  double widthR(double value) => MediaQuery.of(this).size.width * value;

  //* Device Breakpoints
  bool get isMobile => width <= 600;

  bool get isTablet => width > 600;

  bool get isDesktop => width > 950;

  bool get isLargeMobile => isMobile && height > 750;

  bool get isSmallMobile => isMobile && height < 550;

  //* Theme Extensions
  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
