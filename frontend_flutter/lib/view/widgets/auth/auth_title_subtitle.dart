import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthScreenTitleAndSubtitle extends StatelessWidget {
  const AuthScreenTitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "أهلاً بك في منارة",
          style: context.myTextTheme.headlineMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text("بوابتك للعلم والمعرفة", style: context.myTextTheme.headlineSmall),
        SizedBox(height: 20),
      ],
    );
  }
}
