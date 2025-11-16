import 'dart:io';
import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/core/functions/upload_image.dart';
import 'package:courses_app/data/model/lesson_model.dart';
import 'package:courses_app/data/remote/instructor/add_lesson_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class AddLessonControllerAbs extends GetxController {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController duratoinCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  File? courseImage;
  LessonModel lesson = LessonModel();
  AddLessonData addLessonData = AddLessonData();
  void pickImage();
  Future<void> addLesson();
}

class AddLessonController extends AddLessonControllerAbs {
  @override
  pickImage() async {
    courseImage = await uploadImage(
      allowExt: ["jpg", "heic", "kd", "png", "kdjls", "dkj"],
    );
    update();
  }

  @override
  Future<void> addLesson() async {
    var response = await addLessonData.addLesson(
      title: titleCtrl.text,
      description: descriptionCtrl.text,
      duration: duratoinCtrl.text,
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
