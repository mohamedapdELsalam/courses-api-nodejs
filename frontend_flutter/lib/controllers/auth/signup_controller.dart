import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/core/functions/save_userdata_in_storage.dart';
import 'package:courses_app/data/remote/auth/signup_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignupControllerAbs extends GetxController {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordConfirmCtrl = TextEditingController();
  TextEditingController avatarCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData();
  Future<void> signup();
  void resetStatus();
}

class SignupController extends SignupControllerAbs {
  @override
  Future<void> signup() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupData.signupRequest(
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      password: passwordCtrl.text,
      avatar: "profile.jgp",
      role: "user",
    );

    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Map data = response["data"];
        saveUserDataInStorage(data);
        print("------ otp ---- is :${data["otp"]}");
        Get.toNamed(
          AppRoutes.verifyEmail,
          arguments: {"otp": data["otp"], "email": emailCtrl.text},
        );
      } else {
        statusRequest = StatusRequest.fail;
        update();
        Get.defaultDialog(
          title: "error",
          middleText: response["message"] ?? "big error",
          textConfirm: "ok",
          onConfirm: () {
            Get.back();
          },
        );
      }
    } else {
      print("---ebrahem");
      statusRequest = StatusRequest.serverFailure;
      update();
      Get.defaultDialog(
        title: "error",
        middleText: response["message"],
        textConfirm: "ok",
        onConfirm: () {
          Get.back();
        },
      );
      print("error ya ");
    }
  }

  @override
  void resetStatus() {
    statusRequest = StatusRequest.success;
    update();
  }
}
