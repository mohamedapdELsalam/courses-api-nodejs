import 'package:courses_app/controllers/auth/singup_check_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResindOtpWidget extends StatelessWidget {
  const ResindOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupCheckOtpController>(
      builder: (controller) => Column(
        children: [
          !controller.canResnd
              ? Text("يمكنك اعادة ارسال الكود بعد ")
              : TextButton(
                  child: Text("اعادة إرسال الكود"),
                  onPressed: () {
                    controller.reSindOtp();
                  },
                ),
          !controller.canResnd
              ? Text(controller.waitingSeconds.toString())
              : Text(""),
        ],
      ),
    );
  }
}
