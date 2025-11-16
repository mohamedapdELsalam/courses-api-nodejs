import 'package:courses_app/core/classes/crud.dart';
import 'package:courses_app/core/constants/api_links.dart';

class HomepageData {
  Crud crud = Crud();

  Future getCommonCourses() async {
    var response = await crud.getRequest(ApiLinks.commonCourses);

    print(ApiLinks.commonCourses);

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
