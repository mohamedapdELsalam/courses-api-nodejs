class CourseModel {
  String? sId;
  String? title;
  String? description;
  int? price;
  String? image;
  String? language;
  String? level;
  String? duration;
  Map? instructor;
  List? lessons;

  CourseModel({
    this.sId,
    this.title,
    this.description,
    this.price,
    this.image,
    this.language,
    this.level,
    this.duration,
    this.lessons,
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    language = json['language'];
    level = json['level'];
    duration = json['duration'];
    lessons = json['lessons'] ?? [];
    instructor = json['instructor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['language'] = language;
    data['level'] = level;
    data['duration'] = duration;
    data['lessons'] = lessons;
    data['instructor'] = instructor;

    return data;
  }
}
