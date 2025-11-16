import 'package:courses_app/core/constants/image_assets.dart';

class HomepageCoursesCardModel {
  String? image;
  String? title;
  String? subtitle;
  HomepageCoursesCardModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<HomepageCoursesCardModel> homepageCoursesCard = [
  HomepageCoursesCardModel(
    image: ImageAssets.wallpaper1,
    title: "دورة في التصميم الجرافيكي",
    subtitle: "عمر مكرم",
  ),
  HomepageCoursesCardModel(
    image: ImageAssets.wallpaper2,
    title: "دورة احترافية في nodjes",
    subtitle: "عبدالرحمن جمال",
  ),
  HomepageCoursesCardModel(
    image: ImageAssets.wallpaper3,
    title: "اساسيات البرمجةبلغة c++ ",
    subtitle: "أسامة الزيرو",
  ),
  HomepageCoursesCardModel(
    image: ImageAssets.wallpaper4,
    title: "لابتوب",
    subtitle: "عمر مكرم",
  ),
  HomepageCoursesCardModel(
    image: ImageAssets.wallpaper5,
    title: "لابتوب",
    subtitle: "عمر مكرم",
  ),
];
