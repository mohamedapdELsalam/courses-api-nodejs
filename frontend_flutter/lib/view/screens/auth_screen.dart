import 'package:courses_app/controllers/auth/login_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/view/widgets/auth/auth_box.dart';
import 'package:courses_app/view/widgets/auth/auth_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // LoginController controller =
    Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          color: context.myTheme.scaffoldBackgroundColor,
          child: Stack(
            children: [
              Container(height: 350, color: context.myTheme.primaryColor),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AuthScreenTitleAndSubtitle(), LoginAndSignupBox()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
