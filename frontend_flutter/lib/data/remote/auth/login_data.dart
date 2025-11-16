import 'package:courses_app/core/classes/crud.dart';
import 'package:courses_app/core/constants/api_links.dart';

class LoginData {
  Crud crud = Crud();

  Future loginRequest(String email, String password) async {
    var response = await crud.postRequest(ApiLinks.loginLinkApi, {
      "email": email.toString(),
      "password": password.toString(),
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
