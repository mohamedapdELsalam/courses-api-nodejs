import 'dart:async';

import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/core/shared/custom_dialog.dart';
import 'package:courses_app/data/remote/auth/signup_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

abstract class SignupCheckOtpControllerAbs extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController emailCtrl = TextEditingController();
  int? trueOtp;
  int? userOtp;
  Timer? timer;

  int waitingSeconds = 30;
  bool canResnd = false;
  SignupData signupData = SignupData();
  String? email;
  void checkOtp();
  void startTimer();
  void reSindOtp();
}

class SignupCheckOtpController extends SignupCheckOtpControllerAbs {
  @override
  void onInit() {
    trueOtp = Get.arguments["otp"];
    email = Get.arguments["email"];
    startTimer();
    super.onInit();
  }

  @override
  void checkOtp() {
    if (trueOtp == userOtp) {
      customDialog(title: "success", middleText: "تم تفعيل حسابك بنجاح");
      Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 2),
          title: "تم",
          message: " تم تفعيل حسابك بنجاح  ",
        ),
      );
      Get.offAllNamed(AppRoutes.homePage);
    } else {
      customDialog(middleText: "الكود خطأ");
    }
  }

  @override
  void reSindOtp() async {
    startTimer();
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupData.resindOtpRequest(
      email: email!,
      maxCount: "5",
      timeLimit: "3600",
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        trueOtp = response["otp"];
      } else {
        if (response["statusCode"] == 429) {
          customDialog(
            middleText: "انت طلبت اعادة ارسال الكود كثيرا , حاول لاحقاً",
          );
        }
        print("error");
      }
    } else {
      print("server error ");
    }
    update();
  }

  @override
  void startTimer() {
    waitingSeconds = 30;
    canResnd = false;
    update();
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (waitingSeconds > 0) {
        waitingSeconds--;
        update();
      } else {
        canResnd = true;
        t.cancel();
        update();
      }
    });
  }
}
