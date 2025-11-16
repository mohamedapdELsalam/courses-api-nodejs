import 'dart:io';

import 'package:courses_app/core/classes/crud.dart';
import 'package:courses_app/core/constants/api_links.dart';
import 'package:courses_app/core/services.dart';
import 'package:get/get.dart';

class InstructorData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  Future addCourse({
    required String title,
    required String price,
    required String description,
    required,
    required String language,
    required String level,
  }) async {
    print(myServices.sharedPref.getString("user_id"));
    var response = await crud.postRequest(ApiLinks.addCourse, {
      "title": title,
      "price": price,
      "description": description,
      "language": language,
      "level": level,
      "instructor": myServices.sharedPref.getString("user_id"),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  Future addCourseWithPhoto({
    required String title,
    required String price,
    required String description,
    required String language,
    required String level,
    required File file,
  }) async {
    print("------------ instructor id : ");
    print(myServices.sharedPref.getString("user_id"));
    var response = await crud.postRequestWithFile(
      url: ApiLinks.addCourse,
      data: {
        "title": title,
        "price": price,
        "description": description,
        "language": language,
        "level": level,
        "instructor": myServices.sharedPref.getString("user_id"),
      },
      field: "file",
      file: file,
    );

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
