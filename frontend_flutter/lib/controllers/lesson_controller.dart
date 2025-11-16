import 'package:courses_app/data/model/lesson_model.dart';
import 'package:get/get.dart';

abstract class LessonControllerAbs extends GetxController {
  LessonModel lesson = LessonModel();
}

class LessonController extends LessonControllerAbs {
  @override
  void onInit() {
    lesson = Get.arguments["lesson"];
    super.onInit();
  }
}
