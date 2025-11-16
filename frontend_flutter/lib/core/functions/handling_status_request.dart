import 'package:courses_app/core/classes/status_request.dart';

handlingStatusRequest(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
