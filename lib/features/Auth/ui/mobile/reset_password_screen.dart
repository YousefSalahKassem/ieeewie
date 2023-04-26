import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/components/app_text_field.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/validations.dart';
import 'package:ieeewie/features/Auth/blocs/auth_provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

part '../widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: context.width,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Forgot Password",
                    style: context.textTheme.displayLarge!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Type your registered email address to send\nthe confirmation code",
                    style: context.textTheme.headlineMedium!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const _ResetPasswordForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
