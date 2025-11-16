import 'package:courses_app/core/constants/image_assets.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/core/shared/custom_button.dart';
import 'package:courses_app/view/widgets/auth/login/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginByGoogleButton extends StatelessWidget {
  const LoginByGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.07),
      child: Column(
        children: [
          LoginButton(),
          CustomButton(
            text: " أو أكمل باستخدام جوجل",
            onPressed: () {},
            icon: SvgPicture.asset(SvgAssets.coloredGoogle, height: 20),
          ),
        ],
      ),
    );
  }
}
