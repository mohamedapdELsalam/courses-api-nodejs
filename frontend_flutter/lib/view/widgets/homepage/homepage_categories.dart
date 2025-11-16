import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:courses_app/data/static/homepage/homepage_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomepageCategories extends StatelessWidget {
  const HomepageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            homepageCategories.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: 7, right: 7),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: context.screenWidth * 0.08,
                    minRadius: context.screenWidth * 0.01,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.all(
                        Radius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        height: context.screenWidth * 0.15,
                        homepageCategories[index].photo!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  Text(
                    homepageCategories[index].text!,
                    style: context.myTextTheme.titleMedium,
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
