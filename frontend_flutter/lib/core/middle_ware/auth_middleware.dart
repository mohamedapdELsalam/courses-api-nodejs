import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  MyServices servicesController = Get.find();
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    // if (testMode) {
    //   return const RouteSettings(name: AppRoutes.test);
    // }
    if (servicesController.sharedPref.getString("user_firstName") != null) {
      // if (servicesController.sharedPref.getInt("approve") == 0) {
      //   // return const RouteSettings(name: AppRoutes.signupVerifyEmail);
      // } else {
      // }
      return const RouteSettings(name: AppRoutes.homePage);
    }
    return null;
  }
}
