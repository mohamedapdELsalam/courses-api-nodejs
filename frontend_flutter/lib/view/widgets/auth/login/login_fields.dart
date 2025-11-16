import 'package:courses_app/controllers/auth/login_controller.dart';
import 'package:courses_app/core/shared/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFields extends GetView<LoginController> {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        SizedBox(height: 50),
        CustomTextFormField(
          controller: controller.emailCtrl,
          hint: "البريد الإلكتروني",
          suffixIcon: Icon(Icons.person),
        ),
        CustomTextFormField(
          controller: controller.passwordCtrl,
          hint: "كلمة المرور",
          suffixIcon: Icon(Icons.password),
        ),
      ],
    );
  }
}
