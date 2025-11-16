import 'package:courses_app/core/classes/crud.dart';
import 'package:courses_app/core/constants/api_links.dart';
import 'package:courses_app/core/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InstructorCoursesData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  Future getCourses() async {
    var response = await crud.postRequest(ApiLinks.getInstructorCourses, {
      "id": myServices.sharedPref.getString("user_id"),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
