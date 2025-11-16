import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices servicesController = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // if (testMode) {
    //   return const RouteSettings(name: AppRoutes.test);
    // }
    if (servicesController.sharedPref.getInt("step") == 2) {
      return const RouteSettings(name: AppRoutes.homePage);
    } else if (servicesController.sharedPref.getInt("step") == 1) {
      return const RouteSettings(name: AppRoutes.authScreen);
    }
    return null;
  }
}
