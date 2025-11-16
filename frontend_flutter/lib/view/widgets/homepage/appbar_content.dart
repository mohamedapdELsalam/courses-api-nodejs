import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/controllers/homepage_controller.dart';
import 'package:courses_app/core/constants/api_links.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/core/services.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class AppbarHomepageContent extends GetView<HomepageController> {
  const AppbarHomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.myTheme.primaryColor,
              width: context.screenWidth * 0.005,
            ),
          ),
          child: InkWell(
            onTap: () {
              controller.onTapAvatar();
              print("${ApiLinks.imageRoot}/boy.jpg");
            },
            child: CircleAvatar(
              radius: context.screenWidth * 0.05,
              backgroundImage: CachedNetworkImageProvider(
                "${ApiLinks.imageRoot}/boy.jpg",
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadiusGeometry.all(Radius.circular(100)),
              // ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("اهلاً بعودتك", style: context.myTextTheme.labelMedium),
            Text(
              myServices.sharedPref.getString("user_firstName")!,
              style: context.myTextTheme.titleLarge,
            ),
          ],
        ),
        const Spacer(flex: 10),
        Icon(Icons.notifications, size: 35),
      ],
    );
  }
}
