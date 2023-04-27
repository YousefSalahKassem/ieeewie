import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/providers/app_theme_provider.dart';
import 'package:ieeewie/core/blocs/service/firebase_messaging_service.dart';
import 'package:ieeewie/core/components/custom_loader.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/app_theme.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp();

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // final _firebaseMessagingService = FirebaseMessagingService();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(AppThemeProvider.provider.notifier).load();
      // await _firebaseMessagingService.setupFirebaseMessaging();

    });
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log("Couldn't check connectivity status", error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value();
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: AppTheme(
        builder: (theme) {
          return MaterialApp.router(
            title: "IEEE Wie",
            theme: theme,
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              _appRouter,
              initialRoutes: const [SplashRoute()],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Material(
                  color: Colors.transparent,
                  child: LoaderOverlay(
                    overlayColor: AppColors.darkBackground.withOpacity(0.9),
                    useDefaultLoading: false,
                    overlayWidget: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: context.heightR(0.3),
                        ),
                        child: const CustomLoader(),
                      ),
                    ),
                    child: child!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
