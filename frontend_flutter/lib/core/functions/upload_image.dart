import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> uploadImage({
  bool? camera = false,
  List<String>? allowExt,
}) async {
  XFile? pickedImage = await ImagePicker().pickImage(
    source: camera! ? ImageSource.camera : ImageSource.gallery,
    imageQuality: 90,
  );

  if (pickedImage != null) {
    if (allowExt != null && allowExt.isNotEmpty) {
      String extension = pickedImage.path.split('.').last.toLowerCase();
      if (!allowExt.map((e) => e.toLowerCase()).contains(extension)) {
        print("-------");
        Get.defaultDialog(
          title: "error",
          content: Column(
            children: [
              Text("$extension extension is not supported"),
              Text(
                "allow extensions are\n ${allowExt.toString()}",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
        print("this $extension is not supported");
        return null;
      }
    }
    if (kIsWeb) {
      Uint8List bytes = await pickedImage.readAsBytes();
      return bytes;
    } else {
      return File(pickedImage.path);
    }
  } else {
    return null;
  }
}
