import 'package:flutter/material.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:intl/intl.dart' as intl;

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? inputType;
  final bool isPassword;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final String? Function(String? value)? onSubmitted;
  final String? Function(String? value)? onChanged;
  final Color? borderColor;
  final Widget? suffix;
  final double? borderRadius;
  final Color? fillColor;
  final String? initalValue;
  final bool enable;

  const AppTextField({
    this.controller,
    this.hint,
    this.inputType,
    this.maxLength,
    this.isPassword = false,
    this.validator,
    this.borderColor,
    this.suffix,
    this.borderRadius,
    this.fillColor,
    this.onSubmitted,
    this.onChanged,
    this.initalValue,
    this.maxLines,
    this.enable = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;
  bool isRTL = false;
  String text = '';

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return AutoDirection(
      text: text,
      onDirectionChange: (isRTL) {
        setState(() {
          this.isRTL = isRTL;
        });
      },
      child: TextFormField(
        initialValue: widget.initalValue,
        controller: widget.controller,
        style: context.textTheme.headlineMedium!.copyWith(color: Colors.white),
        keyboardType: widget.inputType,
        obscureText: _obscureText,
        enabled: widget.enable,
        maxLength: widget.maxLength,
        validator: widget.validator,
        maxLines: _obscureText ? 1 : widget.maxLines,
        onChanged: (str) {
          widget.onChanged?.call(str);
          setState(() {
            text = str;
          });
        },
        onFieldSubmitted: widget.onSubmitted,
        onSaved: widget.onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hint,
          hintStyle: context.textTheme.headlineSmall!.copyWith(
            color: AppColors.white.withOpacity(0.7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.darkGreyColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.darkGreyColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.darkGreyColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.darkGreyColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: AppColors.darkGreyColor,
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffix ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class AutoDirection extends StatefulWidget {
  final String text;
  final Widget child;
  final void Function(bool isRTL)? onDirectionChange;

  const AutoDirection({
    super.key,
    required this.text,
    required this.child,
    this.onDirectionChange,
  });

  @override
  _AutoDirectionState createState() => _AutoDirectionState();
}

class _AutoDirectionState extends State<AutoDirection> {
  late String text;
  late Widget childWidget;

  @override
  Widget build(BuildContext context) {
    text = widget.text;
    childWidget = widget.child;
    return Directionality(
      textDirection: isRTL(text) ? TextDirection.rtl : TextDirection.ltr,
      child: childWidget,
    );
  }

  @override
  void didUpdateWidget(AutoDirection oldWidget) {
    if (isRTL(oldWidget.text) != isRTL(widget.text)) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => widget.onDirectionChange?.call(
          isRTL(widget.text),
        ),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  bool isRTL(String text) {
    if (text.isEmpty) return Directionality.of(context) == TextDirection.rtl;
    return intl.Bidi.detectRtlDirectionality(text);
  }
}
