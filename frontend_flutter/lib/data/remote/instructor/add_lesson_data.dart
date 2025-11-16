import 'package:courses_app/core/classes/crud.dart';
import 'package:courses_app/core/constants/api_links.dart';

class AddLessonData {
  Crud crud = Crud();

  Future addLesson({
    required String title,
    required String description,
    required String duration,
  }) async {
    var response = await crud.postRequest(ApiLinks.addLesson, {
      "title": title,
      "description": description,
      "course": title,
      "videoUrl": "http:/btngan",
      "duration": duration,
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
