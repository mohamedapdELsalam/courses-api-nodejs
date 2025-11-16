import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/data/model/course_model.dart';
import 'package:courses_app/data/remote/instructor/instructor_courses_data.dart';
import 'package:get/get.dart';

abstract class ViewCoursesControllerAbs extends GetxController {
  List<CourseModel> myCourses = [];
  Future getCourses();
  InstructorCoursesData instructorCoursesData = InstructorCoursesData();
  StatusRequest statusRequest = StatusRequest.none;
  void openCourse(int index);
}

class ViewCoursesController extends ViewCoursesControllerAbs {
  @override
  void onInit() {
    getCourses();
    super.onInit();
  }

  @override
  Future getCourses() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await instructorCoursesData.getCourses();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        myCourses.addAll(data.map((e) => CourseModel.fromJson(e)));
        update();
      } else {}
    } else {}
  }

  @override
  void openCourse(index) {
    Get.toNamed(
      AppRoutes.courseControl,
      arguments: {"course": myCourses[index]},
    );
  }
}
