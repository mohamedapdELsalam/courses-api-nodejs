import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/controllers/homepage_controller.dart';
import 'package:courses_app/core/classes/responsible.dart';
import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonCoursesGridView extends GetView<HomepageController> {
  const CommonCoursesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: controller.commonCourses.length * 200,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.commonCourses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsible.isMobile(context)
                      ? 2
                      : Responsible.isPortrait(context)
                      ? 3
                      : 4,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.75,
                ),

                itemBuilder: (context, index) {
                  var model = controller.commonCourses[index];
                  return InkWell(
                    onTap: () {
                      controller.openCourseDetails(index);
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.vertical(
                                top: Radius.circular(30),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: model.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Spacer(flex: 1),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.title!,
                                    style: context.myTextTheme.titleSmall,
                                  ),
                                  Text(
                                    "${model.instructor!["firstName"]} ${model.instructor!["lastName"]} ",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
