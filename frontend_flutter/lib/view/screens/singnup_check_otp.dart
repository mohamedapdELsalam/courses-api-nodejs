import 'package:courses_app/controllers/auth/singup_check_otp_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/view/widgets/auth/auth_card.dart';
import 'package:courses_app/view/widgets/auth/auth_title_subtitle.dart';
import 'package:courses_app/view/widgets/auth/signup/signup_otp.dart';
import 'package:courses_app/view/widgets/auth/singup_otp/check_otp_button.dart';
import 'package:courses_app/view/widgets/auth/singup_otp/resind_otp_widget.dart';
import 'package:courses_app/view/widgets/auth/singup_otp/signup_otp_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCheckOtpScreen extends StatelessWidget {
  const SignupCheckOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SignupCheckOtpController controller =
    Get.put(SignupCheckOtpController());
    return Scaffold(
      body: Container(
        height: 800,
        color: context.myTheme.scaffoldBackgroundColor,
        child: Stack(
          children: [
            Container(height: 350, color: context.myTheme.primaryColor),
            Positioned(
              left: 0,
              right: 0,
              top: 100,
              child: Column(
                children: [
                  AuthScreenTitleAndSubtitle(),
                  AuthCard(
                    child: Column(
                      spacing: 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OtpSignupTitle(),
                        SignupOtp(),
                        CheckOtpButton(),
                        ResindOtpWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
