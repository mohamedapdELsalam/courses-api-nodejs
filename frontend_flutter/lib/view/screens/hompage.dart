import 'package:courses_app/controllers/homepage_controller.dart';
import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/view/widgets/homepage/appbar_content.dart';
import 'package:courses_app/view/widgets/homepage/categories_text.dart';
import 'package:courses_app/view/widgets/homepage/common_courses_gridview.dart';
import 'package:courses_app/view/widgets/homepage/common_courses_text.dart';
import 'package:courses_app/view/widgets/homepage/continue_study_card.dart';
import 'package:courses_app/view/widgets/homepage/home_search_settings.dart';
import 'package:courses_app/view/widgets/homepage/homepage_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // HomepageController controller =
    Get.put(HomepageController());
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(10),
        toolbarHeight: 80,
        title: AppbarHomepageContent(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.myTheme.scaffoldBackgroundColor,
              const Color.fromARGB(255, 246, 230, 215),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSearchAndSettings(),
              SizedBox(height: context.screenHeight * 0.03),
              const ContinueStudyCard(),
              SizedBox(height: context.screenHeight * 0.03),
              const CategoriesText(),
              const HomepageCategories(),
              const CommonCoursesText(),
              CommonCoursesGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
