import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/constant/env.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/route/routes.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:flutter_boilerplate/feature/course/bloc/course_event.dart';
import 'package:flutter_boilerplate/feature/course/bloc/courses_bloc.dart';
import 'package:flutter_boilerplate/feature/course/resource/repository.dart';
import 'package:flutter_boilerplate/feature/course/ui/widget/home.dart';
// import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
// import 'package:flutter_boilerplate/feature/home/bloc/index.dart';
// import 'package:flutter_boilerplate/feature/home/resource/home_repository.dart';
// import 'package:flutter_boilerplate/feature/home/ui/widget/home_widget.dart';

class CourseHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.adjust),
              onPressed: () {
                // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                // Navigator.pushReplacementNamed(context, Routes.landing);
              },
            ),
          ],
        ),
        body: BlocProvider(
            create: (context) => CoursesBloc(
                courseRepository: CourseRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                        RepositoryProvider.of<InternetCheck>(context)))
              ..add(Fetch()),
            child: Container(child: const HomeWidget())));
  }
}
