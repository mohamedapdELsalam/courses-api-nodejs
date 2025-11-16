import 'package:courses_app/core/constants/image_assets.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.screenHeight * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(100)),
        child: Image.asset(ImageAssets.profile),
      ),
    );
  }
}
