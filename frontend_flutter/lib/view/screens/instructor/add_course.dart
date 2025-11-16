import 'package:courses_app/controllers/instructor/add_course_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/core/shared/custom_button.dart';
import 'package:courses_app/core/shared/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({super.key});

  @override
  Widget build(BuildContext context) {
    AddCourseController controller = Get.put(AddCourseController());
    return Scaffold(
      appBar: AppBar(title: Text("إضافة دورة")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              GetBuilder<AddCourseController>(
                builder: (controller) => SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: controller.courseImage == null
                        ? Center(
                            child: IconButton(
                              icon: Icon((Icons.add)),
                              onPressed: () {
                                controller.pickImage();
                              },
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(20),
                            ),
                            child: Image.file(
                              controller.courseImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              CustomTextFormField(
                hint: "عنوان الدورة",
                controller: controller.titleCtrl,
              ),
              CustomTextFormField(
                hint: "الوصف",
                controller: controller.descriptionCtrl,
              ),
              CustomDropDownField(
                onChanged: (value) {
                  controller.level = value;
                  print(value);
                },
                hint: "المستوي",
                items: [
                  DropdownMenuItem(value: "مبتدأ", child: Text("مبتدأ")),
                  DropdownMenuItem(value: "متوسط", child: Text("متوسط")),
                  DropdownMenuItem(value: "متقدم", child: Text("متقدم")),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextFormField(
                      hint: "اللغة",
                      controller: controller.languageCtrl,
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 5,
                    child: CustomTextFormField(
                      hint: "السعر",
                      controller: controller.priceCtrl,
                    ),
                  ),
                ],
              ),
              CustomButton(
                onPressed: () {
                  controller.addCourse();
                },
                text: "إضافة",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropDownField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final void Function(dynamic value)? onChanged;
  final List<DropdownMenuItem> items;
  const CustomDropDownField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onSaved: onChanged,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: hint,
        labelStyle: TextStyle(fontSize: 15),
        contentPadding: EdgeInsets.only(right: 5),
        // hint: Text(
        //   hint,
        //   style: context.myTextTheme.titleSmall,
        //   textDirection: TextDirection.rtl,
        // ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        fillColor: context.myTheme.colorScheme.onPrimary,
        filled: true,
      ),
      dropdownColor: Colors.white,
      items: items,
      onChanged: onChanged,
    );
  }
}
