import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final TextInputType? keyboard;

  const CustomTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.suffix,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard ?? TextInputType.text,
      controller: controller,
      style: context.myTextTheme.titleMedium,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        suffix: suffix,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: hint,
        labelStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.only(right: 5),
        // hint: Text(
        //   hint,
        //   style: context.myTextTheme.titleSmall,
        //   textDirection: TextDirection.rtl,
        // ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        fillColor: context.myTheme.colorScheme.onPrimary,
        filled: true,
      ),
    );
  }
}
