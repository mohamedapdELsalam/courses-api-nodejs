import 'package:courses_app/controllers/instructor/add_lesson_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/core/shared/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLesson extends StatelessWidget {
  const AddLesson({super.key});

  @override
  Widget build(BuildContext context) {
    AddLessonController controller = Get.put(AddLessonController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
        child: Transform.scale(
          scale: 1.2,
          child: ElevatedButton(
            onPressed: () {
              controller.addLesson();
            },
            child: Text("حفظ الدرس"),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("اضافة درس", style: context.myTextTheme.titleSmall),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SimpleTextForm(
              controller: controller.titleCtrl,
              hint: "عنوان الدرس",
            ),

            Container(
              height: 250,
              child: Card(child: Center(child: Text("preview video"))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200, top: 10),
              child: CustomTextFormField(
                keyboard: TextInputType.number,
                hint: "مدة الدرس",
                controller: controller.duratoinCtrl,
                suffix: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Text("دقيقة"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  SimpleTextForm(
                    controller: controller.descriptionCtrl,
                    hint: "وصف الدرس",
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
                        " إضافة مرفق",
                        style: context.myTextTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.add, color: Colors.grey),
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
                        "انشاء اختبار",
                        style: context.myTextTheme.titleMedium,
                      ),
                      trailing: Icon(Icons.create, color: Colors.grey),
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

class SimpleTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const SimpleTextForm({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.myTextTheme.titleMedium,
      maxLines: 3,
      minLines: 1,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hint: Text(hint),
      ),
    );
  }
}
