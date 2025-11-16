import 'package:get/get.dart';

Future customDialog({String? title, String? middleText, String? confirmText}) {
  return Get.defaultDialog(
    title: title ?? "خطأ",
    middleText: middleText ?? "حدث خطأ ما",
    textConfirm: confirmText ?? "حسناً",
    onConfirm: () {
      Get.back();
    },
  );
}
