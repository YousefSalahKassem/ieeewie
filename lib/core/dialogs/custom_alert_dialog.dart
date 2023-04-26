import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/dialogs/custom_cupertino_dialog.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/themes/color.dart';

class CustomAlertDialog extends StatelessWidget {
  static Future<void> show(
      BuildContext context, {
        required String title,
        required Future<void> Function() onPressed,
        Widget? content,
        required String positiveTitle,
      }) {
    return showDialog(
      context: context,
      builder: (_) => CustomAlertDialog._(
        title,
        onPressed,
        content,
        positiveTitle,
      ),
    );
  }

  final String title;
  final Future<void> Function() onPressed;
  final String positiveTitle;
  final Widget? content;
  const CustomAlertDialog._(
      this.title,
      this.onPressed,
      this.content,
      this.positiveTitle,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,

      child: CustomCupertinoAlertDialog(

        title: Text(
          title,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 0,
          ),
        ),
        content: content?? const SizedBox.shrink(),
        actions: [
          _CupertinoDialogWidget(
            title: "Cancel",
            onPressed: () => context.popRoute(),
          ),
          _CupertinoDialogWidget(
            title: positiveTitle,
            onPressed: onPressed,
            textColor: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }
}

class _CupertinoDialogWidget extends StatelessWidget {
  const _CupertinoDialogWidget({
    required this.title,
    required this.onPressed,
    this.textColor = Colors.white,
  });

  final String title;
  final VoidCallback onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoDialogAction(
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.nunito(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 0,
          ),
        ),
      ),
    );
  }
}
