import 'dart:io';

import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/core/functions/upload_image.dart';
import 'package:courses_app/data/remote/instructor/add_course_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class AddCourseControllerAbs extends GetxController {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController languageCtrl = TextEditingController();
  String? level;
  StatusRequest statusRequest = StatusRequest.none;
  File? courseImage;
  InstructorData instructorData = InstructorData();
  void pickImage();
  void addCourse();
}

class AddCourseController extends AddCourseControllerAbs {
  @override
  pickImage() async {
    courseImage = await uploadImage(
      allowExt: ["jpg", "heic", "kd", "png", "kdjls", "dkj"],
    );
    update();
  }

  @override
  void addCourse() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await instructorData.addCourseWithPhoto(
      title: titleCtrl.text,
      price: priceCtrl.text,
      description: descriptionCtrl.text,
      language: languageCtrl.text,
      level: level!,
      file: courseImage!,
    );
    statusRequest = handlingStatusRequest(response);
    print(response);

    if (statusRequest == StatusRequest.success) {
      print("ksdjd");

      if (response["status"] == "success") {
        print("success");
      } else {}
    } else {
      print("server error");
    }
  }
}
