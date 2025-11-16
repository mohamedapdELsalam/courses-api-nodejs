import 'package:courses_app/controllers/profile_controller.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ProfileController controller = Get.find();

class ProfileCardModel {
  IconData leading;
  IconData trailing;
  String title;
  void Function()? onTap;
  ProfileCardModel({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
  });
}

List<ProfileCardModel> ProfileList = [
  // 1
  ProfileCardModel(
    leading: Icons.person,
    title: "دوراتي",
    trailing: Icons.arrow_forward_ios,
    onTap: () {
      Get.toNamed(AppRoutes.viewCourses);
    },
  ),
  ProfileCardModel(
    leading: Icons.person,
    title: "تعديل الملف الشخصي",
    trailing: Icons.arrow_forward_ios,
    onTap: () {},
  ),
  ProfileCardModel(
    leading: Icons.person,
    title: "اضافة دورة",
    trailing: Icons.arrow_forward_ios,
    onTap: () {
      Get.toNamed(AppRoutes.addCourse);
    },
  ),
  // 2
  ProfileCardModel(
    leading: Icons.notifications_active,
    title: "الإشعارات",
    trailing: Icons.arrow_forward_ios,
    onTap: () {},
  ),
  // 3
  ProfileCardModel(
    leading: Icons.language,
    title: "اللغة",
    trailing: Icons.arrow_forward_ios,
    onTap: () {},
  ),
  // 4
  ProfileCardModel(
    leading: Icons.dark_mode_rounded,
    title: "الثيم",
    trailing: Icons.arrow_forward_ios,
    onTap: () {},
  ),
  // 5
  ProfileCardModel(
    leading: Icons.exit_to_app,
    title: "تسجيل الخروج",
    trailing: Icons.arrow_forward_ios,
    onTap: controller.exit,
  ),
];
