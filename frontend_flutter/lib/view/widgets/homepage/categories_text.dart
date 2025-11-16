import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CategoriesText extends StatelessWidget {
  const CategoriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Text("الفئات", style: context.myTextTheme.titleLarge),
    );
  }
}
