// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../../features/AboutUs/ui/mobile/about_us_screen.dart' as _i8;
import '../../features/AboutUs/ui/mobile/mission_screen.dart' as _i9;
import '../../features/AboutUs/ui/mobile/vision_screen.dart' as _i10;
import '../../features/Auth/ui/mobile/login_screen.dart' as _i2;
import '../../features/Auth/ui/mobile/register_screen.dart' as _i3;
import '../../features/Auth/ui/mobile/reset_password_screen.dart' as _i4;
import '../../features/Auth/ui/mobile/splash_screen.dart' as _i1;
import '../../features/Board/ui/mobile/board_screen.dart' as _i11;
import '../../features/ContactUs/ui/mobile/contact_us_screen.dart' as _i12;
import '../../features/Events/model/event.dart' as _i17;
import '../../features/Events/ui/mobile/event_details_screen.dart' as _i7;
import '../../features/Home/ui/mobile/edit_profile_screen.dart' as _i13;
import '../../features/Home/ui/mobile/home_screen.dart' as _i5;
import '../../features/Home/ui/mobile/search_result_screen.dart' as _i6;
import '../../features/MemberShip/ui/mobile/membership_screen.dart' as _i14;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.RegisterScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ResetPasswordScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchResultRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.SearchResultScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EventDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailsRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EventDetailsScreen(event: args.event),
      );
    },
    AboutUsRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.AboutUsScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MissionRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.MissionScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VisionRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.VisionScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BoardRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.BoardScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactUsRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.ContactUsScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: _i13.EditProfileScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MemberShipRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.MemberShipScreen(),
        transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i15.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i15.RouteConfig(
          RegisterRoute.name,
          path: '/register',
        ),
        _i15.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset',
        ),
        _i15.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i15.RouteConfig(
          SearchResultRoute.name,
          path: '/results',
        ),
        _i15.RouteConfig(
          EventDetailsRoute.name,
          path: '/eventDetails',
        ),
        _i15.RouteConfig(
          AboutUsRoute.name,
          path: '/aboutus',
        ),
        _i15.RouteConfig(
          MissionRoute.name,
          path: '/mission',
        ),
        _i15.RouteConfig(
          VisionRoute.name,
          path: '/vision',
        ),
        _i15.RouteConfig(
          BoardRoute.name,
          path: '/board',
        ),
        _i15.RouteConfig(
          ContactUsRoute.name,
          path: '/contactus',
        ),
        _i15.RouteConfig(
          EditProfileRoute.name,
          path: '/editprofile',
        ),
        _i15.RouteConfig(
          MemberShipRoute.name,
          path: '/membership',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.ResetPasswordScreen]
class ResetPasswordRoute extends _i15.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.SearchResultScreen]
class SearchResultRoute extends _i15.PageRouteInfo<void> {
  const SearchResultRoute()
      : super(
          SearchResultRoute.name,
          path: '/results',
        );

  static const String name = 'SearchResultRoute';
}

/// generated route for
/// [_i7.EventDetailsScreen]
class EventDetailsRoute extends _i15.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({required _i17.Event event})
      : super(
          EventDetailsRoute.name,
          path: '/eventDetails',
          args: EventDetailsRouteArgs(event: event),
        );

  static const String name = 'EventDetailsRoute';
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({required this.event});

  final _i17.Event event;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{event: $event}';
  }
}

/// generated route for
/// [_i8.AboutUsScreen]
class AboutUsRoute extends _i15.PageRouteInfo<void> {
  const AboutUsRoute()
      : super(
          AboutUsRoute.name,
          path: '/aboutus',
        );

  static const String name = 'AboutUsRoute';
}

/// generated route for
/// [_i9.MissionScreen]
class MissionRoute extends _i15.PageRouteInfo<void> {
  const MissionRoute()
      : super(
          MissionRoute.name,
          path: '/mission',
        );

  static const String name = 'MissionRoute';
}

/// generated route for
/// [_i10.VisionScreen]
class VisionRoute extends _i15.PageRouteInfo<void> {
  const VisionRoute()
      : super(
          VisionRoute.name,
          path: '/vision',
        );

  static const String name = 'VisionRoute';
}

/// generated route for
/// [_i11.BoardScreen]
class BoardRoute extends _i15.PageRouteInfo<void> {
  const BoardRoute()
      : super(
          BoardRoute.name,
          path: '/board',
        );

  static const String name = 'BoardRoute';
}

/// generated route for
/// [_i12.ContactUsScreen]
class ContactUsRoute extends _i15.PageRouteInfo<void> {
  const ContactUsRoute()
      : super(
          ContactUsRoute.name,
          path: '/contactus',
        );

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i13.EditProfileScreen]
class EditProfileRoute extends _i15.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(
          EditProfileRoute.name,
          path: '/editprofile',
        );

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i14.MemberShipScreen]
class MemberShipRoute extends _i15.PageRouteInfo<void> {
  const MemberShipRoute()
      : super(
          MemberShipRoute.name,
          path: '/membership',
        );

  static const String name = 'MemberShipRoute';
}
