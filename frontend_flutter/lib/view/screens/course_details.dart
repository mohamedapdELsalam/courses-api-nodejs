import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/controllers/course_details_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CourseDetailsController controller = Get.put(CourseDetailsController());
    var model = controller.course;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("تفاصيل الدورة"),
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
          // Image.asset(
          //   ImageAssets.largeSpace,
          //   fit: BoxFit.cover,
          //   height: 800,
          //   opacity: AlwaysStoppedAnimation(0.12),
          // ),
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
                          controller.course.lessons![index]["title"],
                          style: context.myTextTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "${controller.course.lessons![index]["duration"]} دقيقة",
                        ),
                      ),
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

class CourseDetailsCard extends GetView<CourseDetailsController> {
  final String title;
  final Widget icon;
  const CourseDetailsCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        color: Color.fromARGB(255, 254, 230, 187),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 2, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.myTextTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
