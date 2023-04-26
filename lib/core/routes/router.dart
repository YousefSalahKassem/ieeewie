import 'package:auto_route/auto_route.dart';
import 'package:ieeewie/features/AboutUs/ui/mobile/about_us_screen.dart';
import 'package:ieeewie/features/AboutUs/ui/mobile/mission_screen.dart';
import 'package:ieeewie/features/AboutUs/ui/mobile/vision_screen.dart';
import 'package:ieeewie/features/Auth/ui/mobile/login_screen.dart';
import 'package:ieeewie/features/Auth/ui/mobile/register_screen.dart';
import 'package:ieeewie/features/Auth/ui/mobile/reset_password_screen.dart';
import 'package:ieeewie/features/Auth/ui/mobile/splash_screen.dart';
import 'package:ieeewie/features/Board/ui/mobile/board_screen.dart';
import 'package:ieeewie/features/ContactUs/ui/mobile/contact_us_screen.dart';
import 'package:ieeewie/features/Events/ui/mobile/event_details_screen.dart';
import 'package:ieeewie/features/Home/ui/mobile/edit_profile_screen.dart';
import 'package:ieeewie/features/Home/ui/mobile/home_screen.dart';
import 'package:ieeewie/features/Home/ui/mobile/search_result_screen.dart';
import 'package:ieeewie/features/MemberShip/ui/mobile/membership_screen.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute> [
    AutoRoute(page: SplashScreen, initial: true, path: '/'),
    CustomRoute(page: LoginScreen, path: '/login',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: RegisterScreen, path: '/register',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ResetPasswordScreen, path: '/reset',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: HomeScreen, path: '/home',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: SearchResultScreen, path: '/results',transitionsBuilder: TransitionsBuilders.fadeIn),
    AutoRoute(page: EventDetailsScreen, path: '/eventDetails'),
    CustomRoute(page: AboutUsScreen, path: '/aboutus',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: MissionScreen, path: '/mission',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: VisionScreen, path: '/vision',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: BoardScreen, path: '/board',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ContactUsScreen, path: '/contactus',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: EditProfileScreen, path: '/editprofile',transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: MemberShipScreen, path: '/membership',transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)

class $AppRouter {}
