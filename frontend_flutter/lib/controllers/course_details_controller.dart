import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/data/model/course_model.dart';
import 'package:courses_app/data/model/lesson_model.dart';
import 'package:get/get.dart';

abstract class CourseDetailsControllerAbs extends GetxController {
  CourseModel course = CourseModel();
  void openLesson(int index);
}

class CourseDetailsController extends CourseDetailsControllerAbs {
  @override
  void onInit() {
    course = Get.arguments["course"];
    super.onInit();
  }

  @override
  void openLesson(int index) {
    LessonModel lesson = LessonModel.fromJson(course.lessons![index]);

    Get.toNamed(AppRoutes.lessonScreen, arguments: {"lesson": lesson});
  }
}
