import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/services.dart';
import 'package:get/get.dart';

abstract class ProfileControllerAbs extends GetxController {
  void exit();
  MyServices myServices = Get.find();
}

class ProfileController extends ProfileControllerAbs {
  @override
  void exit() {
    myServices.sharedPref.clear();
    Get.offAllNamed(AppRoutes.authScreen);
  }
}
