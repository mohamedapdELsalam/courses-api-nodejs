import 'package:courses_app/core/constants/image_assets.dart';

class HomepageCategoriesModel {
  String? photo;
  String? text;
  HomepageCategoriesModel({required this.photo, required this.text});
}

List<HomepageCategoriesModel> homepageCategories = [
  HomepageCategoriesModel(photo: SvgAssets.code, text: "برمجة"),
  HomepageCategoriesModel(photo: SvgAssets.translation, text: "لغات"),
  HomepageCategoriesModel(photo: SvgAssets.design, text: "تصميم"),
  HomepageCategoriesModel(photo: SvgAssets.business, text: "ادارة اعمال"),
  HomepageCategoriesModel(photo: SvgAssets.quran, text: "علوم شرعية"),
];
