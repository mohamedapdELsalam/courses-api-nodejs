import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/core/functions/save_userdata_in_storage.dart';
import 'package:courses_app/data/model/user_model.dart';
import 'package:courses_app/data/remote/auth/login_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbs extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  Future<void> login();
  LoginData loginData = LoginData();
  StatusRequest statusRequest = StatusRequest.none;
  UserModel userModel = UserModel();
}

class LoginController extends LoginControllerAbs {
  @override
  login() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.loginRequest(
      emailCtrl.text,
      passwordCtrl.text,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Map<String, dynamic> data = response["data"];
        userModel = UserModel.fromJson(data);
        saveUserDataInStorage(data);
        Get.offNamed(AppRoutes.homePage);
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
      print("error ya ");
    }
  }
}
