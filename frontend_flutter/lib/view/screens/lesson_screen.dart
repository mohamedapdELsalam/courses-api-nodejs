import 'package:courses_app/controllers/lesson_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LessonController controller = Get.put(LessonController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
        child: Transform.scale(
          scale: 1.2,
          child: ElevatedButton(onPressed: () {}, child: Text("إتمام الدرس")),
        ),
      ),
      appBar: AppBar(
        title: Text(
          controller.lesson.title!,
          style: context.myTextTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              child: Card(child: Center(child: Text("preview video"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Text("عن الدرس", style: context.myTextTheme.titleSmall),
                  SizedBox(height: 20),
                  Text(
                    controller.lesson.discription ?? "",
                    style: context.myTextTheme.titleSmall,
                  ),
                  SizedBox(height: 25),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.note,
                        color: context.myTheme.primaryColor,
                      ),
                      onTap: () {},
                      title: Text(
                        "ملخص الدرس",
                        style: context.myTextTheme.titleMedium,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.text_snippet_sharp,
                        color: context.myTheme.primaryColor,
                      ),
                      onTap: () {},
                      title: Text(
                        "اختبار",
                        style: context.myTextTheme.titleMedium,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
