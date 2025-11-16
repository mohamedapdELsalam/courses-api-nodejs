import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/controllers/instructor/view_courses_controller.dart';
import 'package:courses_app/core/classes/status_request.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ViewCourses extends StatelessWidget {
  const ViewCourses({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewCoursesController controller =
    Get.put(ViewCoursesController());
    return Scaffold(
      appBar: AppBar(title: Text("دوراتي")),
      body: Container(
        height: 800,
        child: GetBuilder<ViewCoursesController>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.myCourses.length,
                  itemBuilder: (context, index) {
                    var model = controller.myCourses[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.openCourse(index);
                          },
                          child: Card(
                            shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),

                            color: Colors.white,
                            child: SizedBox(
                              height: 280,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.vertical(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model.title!,
                                            style:
                                                context.myTextTheme.titleSmall,
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
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
