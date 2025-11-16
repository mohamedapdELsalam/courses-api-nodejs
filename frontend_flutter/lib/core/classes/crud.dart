import 'dart:convert';
import 'dart:io';
import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/functions/is_online.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
    if (await isOnline()) {
      try {
        http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"},
        );

        print("response : ${response.body}");
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } catch (e) {
        return Left(StatusRequest.execptionFailure);
      }
    } else {
      return Left(StatusRequest.offlineFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getRequest(String url) async {
    if (!await isOnline()) {
      return Left(StatusRequest.offlineFailure);
    }
    try {
      var response = await http.get(Uri.parse(url));
      print("response : ");
      print(response.body);
      print(response.statusCode);

      var responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } catch (e) {
      return Left(StatusRequest.execptionFailure);
    }
  }

  //---------------------------------------

  Future<Either<StatusRequest, Map>> postRequestWithFile({
    required String url,
    required String field,
    required Map data,
    required File file,
  }) async {
    if (await isOnline() == false) {
      print("offline");
      return Left(StatusRequest.offlineFailure);
    }

    var request = http.MultipartRequest("POST", Uri.parse(url));

    String ext = file.path.split('.').last.toLowerCase();

    request.files.add(
      await http.MultipartFile.fromPath(
        field,
        file.path,
        filename: basename(file.path),
        contentType: MediaType("image", ext),
      ),
    );

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    print("sending...");
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(response.body));
      } else {
        print("Upload failed");
        return const Left(StatusRequest.fail);
      }
    } catch (_) {
      print("JSON parse error");
      return const Left(StatusRequest.serverFailure);
    }
  }
}
