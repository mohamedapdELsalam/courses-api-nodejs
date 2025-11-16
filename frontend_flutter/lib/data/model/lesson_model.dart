class LessonModel {
  String? sId;
  String? title;
  String? duration;
  String? videoUrl;
  int? order;
  String? course;
  String? discription;
  int? iV;

  LessonModel({
    this.sId,
    this.title,
    this.duration,
    this.videoUrl,
    this.order,
    this.course,
    this.iV,
    this.discription,
  });

  LessonModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    duration = json['duration'];
    videoUrl = json['videoUrl'];
    order = json['order'];
    course = json['course'];
    discription = json['discription'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['duration'] = duration;
    data['videoUrl'] = videoUrl;
    data['order'] = order;
    data['course'] = course;
    data['discription'] = discription;
    data['__v'] = iV;
    return data;
  }
}
