import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/feature/course/model/course.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseEmpty extends CourseState {}

class CourseLoading extends CourseState {}

class CourseError extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  const CourseLoaded({this.courses});

  CourseLoaded copyWith({List<Course> posts}) {
    return CourseLoaded(courses: posts ?? this.courses);
  }

  @override
  List<Object> get props => [courses];

  @override
  String toString() => 'PostLoaded { posts: ${courses.length} }';
}
