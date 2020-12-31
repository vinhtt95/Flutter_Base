import 'dart:async';
import 'dart:developer';

import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:meta/meta.dart';

class CourseApiProvider {
  CourseApiProvider({@required this.baseUrl, @required this.apiProvider})
      : assert(apiProvider != null);

  final ApiProvider apiProvider;

  final String baseUrl;

  Future<Map<String, dynamic>> fetchCourses() {
    apiProvider.get('$baseUrl/video/getAll');
    log('data: CourseApiProvider: $apiProvider');
    print(apiProvider);

    return apiProvider.get('$baseUrl/video/getAll');
  }
}
