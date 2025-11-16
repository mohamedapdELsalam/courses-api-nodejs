import 'package:courses_app/core/services.dart';
import 'package:get/get.dart';

void saveUserDataInStorage(Map data) {
  MyServices services = Get.find();
  services.sharedPref.setString("user_id", data["_id"].toString());
  services.sharedPref.setString("user_firstName", data["firstName"].toString());
  services.sharedPref.setString("user_lastName", data["lastName"]);
  services.sharedPref.setString("user_email", data["email"].toString());
  services.sharedPref.setString("user_phone", data["user_phone"].toString());
  services.sharedPref.setString("user_token", data["token"].toString());
  services.sharedPref.setString("user_role", data["role"].toString());
  services.sharedPref.setString("user_avatar", data["avatar"].toString());
  // services.sharedPref.setInt("step", 2);
}
