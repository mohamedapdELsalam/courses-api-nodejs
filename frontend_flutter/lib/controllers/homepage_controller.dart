import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/functions/handling_status_request.dart';
import 'package:courses_app/data/model/course_model.dart';
import 'package:courses_app/data/remote/homepage_data.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

abstract class HomepageControllerAbs extends GetxController {
  List<CourseModel> commonCourses = [];
  HomepageData homepageData = HomepageData();
  StatusRequest statusRequest = StatusRequest.none;
  void onTapAvatar();
  void Function()? openCourseDetails(int index);
  void getCommonCourses() {}
}

class HomepageController extends HomepageControllerAbs {
  @override
  void onInit() {
    print("kds");
    getCommonCourses();
    super.onInit();
  }

  @override
  void onTapAvatar() {
    Get.toNamed(AppRoutes.profileScreen);
  }

  @override
  openCourseDetails(index) {
    Get.toNamed(
      AppRoutes.courseDetails,
      arguments: {"course": commonCourses[index]},
    );
    return null;
  }

  @override
  Future getCommonCourses() async {
    statusRequest = StatusRequest.loading;
    update();
    print("------ response is : ------");
    var response = await homepageData.getCommonCourses();
    print("------ response is : ------");
    print(response);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        commonCourses.addAll(data.map((e) => CourseModel.fromJson(e)));
        update();
        print(commonCourses);
      } else {
        print("---------------- lila kpera 2 --------------");
        statusRequest = StatusRequest.fail;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
      print("---------------- lila kpera 0 --------------");
    }
  }
}
