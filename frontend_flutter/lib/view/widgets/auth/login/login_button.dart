import 'package:courses_app/controllers/auth/login_controller.dart';
import 'package:courses_app/core/classes/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => ElevatedButton(
        onPressed: () {
          controller.login();
        },
        child: Stack(
          children: [
            controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: CircularProgressIndicator(
                      constraints: BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 30,
                        minHeight: 20,
                        minWidth: 20,
                      ),
                    ),
                  )
                : Center(child: Text("الدخول")),
          ],
        ),
      ),
    );
  }
}
