class ApiLinks {
  static const String serverLink =
      "https://courses-api-nodejs-hv2r.onrender.com";
  static const String apiLink = "$serverLink/api";

  static const String role = "$apiLink/users";

  //auth
  static const String loginLinkApi = "$role/login";
  static const String signLinkApi = "$role/register";
  static const String singnupCheckOtp = "$role/checkOtp";
  static const String singnupResindOtp = "$role/resindOtp";
  //courses
  static const String coursesRoot = "$apiLink/courses";
  static const String commonCourses = "$coursesRoot/commonCourses";
  static const String addCourse = coursesRoot;
  static const String addLesson = "$apiLink/lessons";

  //instructor
  static const String getInstructorCourses = "$apiLink/instructors";

  //images
  static const String imageRoot = "$serverLink/uploads";

  //test
  static const String addDataLinkApi = "$serverLink/test/addData.php";
  static const String getDataLinkApi = "$serverLink/test/getData.php";
}
