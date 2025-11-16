import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/controllers/instructor/course_control_controller.dart';
import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/view/screens/course_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseControl extends StatelessWidget {
  const CourseControl({super.key});

  @override
  Widget build(BuildContext context) {
    CourseControlController controller = Get.put(CourseControlController());
    var model = controller.course;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          controller.course.title!,
          style: context.myTextTheme.titleSmall,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: CachedNetworkImage(imageUrl: model.image!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CourseDetailsCard(
                        title: "${controller.course.price.toString()} LE",
                        icon: Icon(Icons.attach_money_sharp),
                      ),
                      CourseDetailsCard(
                        icon: Icon(Icons.person),
                        title:
                            "${model.instructor!["firstName"]} ${model.instructor!["lastName"]} ",
                      ),
                      CourseDetailsCard(
                        icon: Icon(Icons.timelapse_sharp),
                        title: controller.course.duration ?? "بدون وقت محدد",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "عن الدورة",
                          style: context.myTextTheme.titleMedium,
                        ),
                        SizedBox(height: 7),
                        Text(controller.course.description!),
                        SizedBox(height: 10),
                        Text(
                          "محتوي الدورة",
                          style: context.myTextTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  ...List.generate(
                    controller.course.lessons!.length,
                    (index) => Card(
                      child: ListTile(
                        onTap: () {
                          controller.openLesson(index);
                        },
                        leading: Icon(
                          Icons.play_arrow,
                          color: context.myTheme.primaryColor,
                        ),
                        title: Text(
                          "${controller.course.lessons![index]["title"]}",
                          style: context.myTextTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "${controller.course.lessons![index]["duration"]} دقيقة",
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.addLesson);
                      },
                      leading: Icon(
                        Icons.add,
                        color: context.myTheme.primaryColor,
                      ),
                      title: Text(
                        "إضافة درس",
                        style: context.myTextTheme.titleMedium,
                      ),
                      subtitle: Text("قم باضافة درس جديد"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
