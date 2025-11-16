import 'package:courses_app/view/widgets/auth/auth_card.dart';
import 'package:courses_app/view/widgets/auth/login/login_view.dart';
import 'package:courses_app/view/widgets/auth/signup/signup_view.dart';
import 'package:flutter/material.dart';

class LoginAndSignupBox extends StatelessWidget {
  const LoginAndSignupBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCard(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "تسجيل"),
                Tab(text: "إنشاء حساب"),
              ],
            ),
            Expanded(child: TabBarView(children: [LoginView(), SignupView()])),
          ],
        ),
      ),
    );
  }
}
