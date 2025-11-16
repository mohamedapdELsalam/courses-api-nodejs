import 'package:courses_app/core/classes/crud.dart';
import 'package:courses_app/core/constants/api_links.dart';

class SignupData {
  Crud crud = Crud();

  Future signupRequest({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? role,
    String? avatar,
  }) async {
    var response = await crud.postRequest(ApiLinks.signLinkApi, {
      "firstName": firstName.toString(),
      "lastName": lastName.toString(),
      "email": email.toString(),
      "password": password.toString(),
      "role": role.toString(),
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  Future resindOtpRequest({
    required String email,
    required String timeLimit,
    required String maxCount,
  }) async {
    var response = await crud.postRequest(ApiLinks.singnupResindOtp, {
      "email": email,
      "timeLimit": timeLimit,
      "maxCount": maxCount,
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
