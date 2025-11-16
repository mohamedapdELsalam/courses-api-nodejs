import 'package:courses_app/controllers/auth/signup_controller.dart';
import 'package:courses_app/core/shared/custom_textform.dart';
import 'package:flutter/material.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({super.key, required this.controller});

  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 15,
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: controller.firstNameCtrl,
                hint: "اسمك الاول",
                suffixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: CustomTextFormField(
                controller: controller.lastNameCtrl,
                hint: "اسمك العائلة",
                suffixIcon: Icon(Icons.person),
              ),
            ),
          ],
        ),

        CustomTextFormField(
          controller: controller.emailCtrl,
          hint: "البريد الإلكتروني",
          suffixIcon: Icon(Icons.mail),
        ),
        CustomTextFormField(
          controller: controller.phoneCtrl,
          hint: "رقم الهاتف",
          suffixIcon: Icon(Icons.phone),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: controller.passwordCtrl,
                hint: "كلمة المرور",
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: CustomTextFormField(
                controller: controller.passwordConfirmCtrl,
                hint: "تأكيد كلمة المرور",
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
