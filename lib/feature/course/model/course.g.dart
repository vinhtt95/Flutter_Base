part of 'course.dart';

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
      id: json['id'] as int,
      cardId: json['cardId'] as int,
      subId: json['subId'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      sub: json['sub'] as String);
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'cardId': instance.cardId,
      'subId': instance.subId,
      'title': instance.title,
      'url': instance.url,
      'sub': instance.sub,
    };
