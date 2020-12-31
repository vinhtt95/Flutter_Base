import 'dart:developer';

import 'package:flutter_boilerplate/common/constant/env.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/http/response.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:flutter_boilerplate/feature/course/model/course.dart';
import 'package:meta/meta.dart';

import 'api_provider.dart';

class CourseRepository {
  ApiProvider apiProvider;
  CourseApiProvider courseApiProvider;
  InternetCheck internetCheck;
  Env env;

  CourseRepository(
      {@required this.env,
      @required this.apiProvider,
      @required this.internetCheck}) {
    courseApiProvider =
        CourseApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }

  Future<DataResponse<List<Course>>> fetchCourses() async {
    final response = await courseApiProvider.fetchCourses();

    if (response == null) {
      return DataResponse.connectivityError();
    }

    if (response['error']) {
      log('data: $response');
      final List<Course> _courses =
          (response['data'] as List)?.map((dynamic e) {
        return e == null ? null : Course.fromJson(e as Map<String, dynamic>);
      })?.toList();
      return DataResponse.success(_courses);
    } else {
      return DataResponse.error("Error");
    }
  }
}
