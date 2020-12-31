import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'cardId')
  final int cardId;
  @JsonKey(name: 'subId')
  final int subId;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'sub')
  final String sub;
  @JsonKey(name: 'url')
  final String url;

  Course({this.id, this.title, this.sub, this.subId, this.url, this.cardId});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  // Equatable
  @override
  List<Object> get props => [id, title, sub, subId, url, cardId];

  @override
  String toString() => 'Post { id: $id }';
}
