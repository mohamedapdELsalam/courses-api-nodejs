import 'package:courses_app/controllers/auth/signup_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/view/widgets/auth/signup/signup_button.dart';
import 'package:courses_app/view/widgets/auth/signup/signup_fields.dart';
import 'package:courses_app/view/widgets/auth/signup/signup_google_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 15,
        children: [
          SignupFields(controller: controller),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                SignupButton(),
                SignupByGoogleButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
