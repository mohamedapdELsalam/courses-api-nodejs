import 'package:courses_app/controllers/auth/singup_check_otp_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpSignupTitle extends GetView<SignupCheckOtpController> {
  const OtpSignupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: context.myTextTheme.titleMedium,
      textAlign: TextAlign.center,
      '''راجع البريد الالكتروني لقد ارسلنا إليك كود تحقق علي بريدك الالكتروني
    ${controller.email}
''',
    );
  }
}
