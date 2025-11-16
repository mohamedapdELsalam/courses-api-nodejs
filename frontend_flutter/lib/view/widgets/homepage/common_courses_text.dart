import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CommonCoursesText extends StatelessWidget {
  const CommonCoursesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Text("دورات شائعة", style: context.myTextTheme.titleLarge),
    );
  }
}
