import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joha_test/utils/constants/colors.dart';

class JTextFieldWidget extends StatelessWidget {
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String? hintText;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final bool hasBorder;
  final TextInputType? keyboardType;
  final TextStyle? hintTextStyle;
  final BorderRadius? borderRadius;
  final Color? tappedColor;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final bool? enabled;
  final double? focusBorderWidth;
  final Color? focusColor;
  final double? borderWidth;
  final Color? borderColor;
  final Color? enableBorderColor;
  final VoidCallback? onTap;
  final Function(String)?  onChanged;
  final Widget? suffix;
  final TextStyle? suffixStyle;
  final String? label;
  final bool? filled;
  final TextStyle? labelStyle;
  final Widget? prefix;
  final String? labelText;
  final bool? readOnly;

  final TextAlign? textAlignPosition;
  final List<TextInputFormatter>? inputFormatters;
  const JTextFieldWidget({
    Key? key,
    this.focusColor,
    this.labelText,
    this.filled,
    this.borderColor,
    this.labelStyle,
    this.focusBorderWidth,
    this.textAlignPosition,
    this.borderWidth,
    this.textInputAction,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.backgroundColor,
    this.validator,
    this.label,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.hasBorder = false,
    this.keyboardType,
    this.hintTextStyle,
    this.borderRadius,
    this.tappedColor,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.autofocus = false,
    this.enabled,
    this.padding,
    this.inputFormatters,
    this.enableBorderColor,
    this.onTap,
    this.suffix,
    this.prefix,
    this.suffixStyle,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: autofocus,
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      onFieldSubmitted: onSubmitted,
      onSaved: (value) => onSubmitted!(value!),
      obscureText: obscureText,
      cursorColor: Theme.of(context).colorScheme.surface,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      textAlign: textAlignPosition ?? TextAlign.left,
      decoration: InputDecoration(
        filled: true,
        contentPadding: padding,
       // label: Text(label ?? ''),
        labelStyle: labelStyle,
        fillColor: backgroundColor ?? Theme.of(context).colorScheme.background,
        // errorBorder: ,
        prefix: prefix,
        suffix: suffix,
        suffixStyle: suffixStyle,
        suffixIcon: suffixIcon,
        suffixIconColor:
            suffixIconColor ?? Theme.of(context).colorScheme.primary,
        prefixIcon: prefixIcon,
        prefixIconColor:
            prefixIconColor ?? Theme.of(context).colorScheme.primary,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xFF667398),
                  fontSize: 14.sp,
    fontFamily: 'Work Sans',
    fontWeight: FontWeight.w400,
                ),
        enabledBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(7),
          borderSide: BorderSide(
            width: focusBorderWidth ?? 1,
            color:  const Color(0xFFC2C7D6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            width: focusBorderWidth ?? 1,
            color:  JColors.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(7),
          borderSide: BorderSide(
            width: borderWidth ?? 2,
            color: const Color(0xFFC2C7D6),
          ),
        ),
      ),
    );
  }
}