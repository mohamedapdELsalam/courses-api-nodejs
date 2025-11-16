import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/middle_ware/auth_middleware.dart';
import 'package:courses_app/view/screens/auth_screen.dart';
import 'package:courses_app/view/screens/course_details.dart';
import 'package:courses_app/view/screens/hompage.dart';
import 'package:courses_app/view/screens/instructor/add_course.dart';
import 'package:courses_app/view/screens/instructor/add_lesson.dart';
import 'package:courses_app/view/screens/instructor/course_control.dart';
import 'package:courses_app/view/screens/instructor/view_courses.dart';
import 'package:courses_app/view/screens/lesson_screen.dart';
import 'package:courses_app/view/screens/profile_screen.dart';
import 'package:courses_app/view/screens/singnup_check_otp.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? myPages = [
  GetPage(
    name: AppRoutes.authScreen,
    page: () => AuthScreen(),
    middlewares: [AuthMiddleWare()],
  ),
  GetPage(name: AppRoutes.homePage, page: () => HomePage()),
  GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
  GetPage(name: AppRoutes.verifyEmail, page: () => SignupCheckOtpScreen()),
  GetPage(name: AppRoutes.courseDetails, page: () => CourseDetailsScreen()),
  GetPage(name: AppRoutes.lessonScreen, page: () => LessonScreen()),
  GetPage(name: AppRoutes.addCourse, page: () => AddCourse()),
  GetPage(name: AppRoutes.viewCourses, page: () => ViewCourses()),
  GetPage(name: AppRoutes.courseControl, page: () => CourseControl()),
  GetPage(name: AppRoutes.addLesson, page: () => AddLesson()),
];
