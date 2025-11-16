import 'package:courses_app/core/constants/image_assets.dart';
import 'package:courses_app/core/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupByGoogleButton extends StatelessWidget {
  const SignupByGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: " أو أكمل باستخدام جوجل",
      onPressed: () {},
      icon: SvgPicture.asset(SvgAssets.coloredGoogle, height: 20),
    );
  }
}
