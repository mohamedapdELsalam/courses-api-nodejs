import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TextFormFieldHomePage extends StatelessWidget {
  const TextFormFieldHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.myTextTheme.titleMedium,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hint: Text(
          "ابحث عن دورات....",
          style: context.myTextTheme.labelMedium,
          textDirection: TextDirection.rtl,
        ),
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
