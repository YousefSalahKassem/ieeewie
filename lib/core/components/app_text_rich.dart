import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/themes/color.dart';

class AppTextRich extends StatelessWidget {
  final String firstText;
  final String labelButton;
  final VoidCallback onPressed;

  const AppTextRich({
    required this.firstText,
    required this.labelButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstText ',
            style: context.textTheme.headlineMedium!
                .copyWith(color: AppColors.darkGreyColor),
          ),
          TextSpan(
            text: labelButton,
            style: context.textTheme.headlineMedium!
                .copyWith(color: AppColors.secondaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
