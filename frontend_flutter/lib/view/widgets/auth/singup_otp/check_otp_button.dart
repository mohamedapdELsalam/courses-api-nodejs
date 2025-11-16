import 'package:courses_app/controllers/auth/singup_check_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOtpButton extends GetView<SignupCheckOtpController> {
  const CheckOtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.checkOtp();
      },
      child: Text("التحقق"),
    );
  }
}
