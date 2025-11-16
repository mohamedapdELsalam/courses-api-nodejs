import 'package:courses_app/controllers/auth/login_controller.dart';
import 'package:courses_app/view/widgets/auth/login/google_button.dart';
import 'package:courses_app/view/widgets/auth/login/login_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 15,
        children: [
          LoginFields(),
          TextButton(child: Text("هل نسيت كلمة المرور ؟"), onPressed: () {}),
          LoginByGoogleButton(),
        ],
      ),
    );
  }
}
