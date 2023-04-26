import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ieeewie/core/components/app_text_field.dart';
import 'package:ieeewie/core/components/app_text_rich.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/validations.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Auth/blocs/auth_provider.dart';
import 'package:ieeewie/features/Auth/model/user.dart';
import 'package:loader_overlay/loader_overlay.dart';


part '../widgets/login_form.dart';
part '../widgets/login_options.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SvgPicture.asset(
                  AppSvg.login,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const _LoginForm(),
              const _LoginOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
