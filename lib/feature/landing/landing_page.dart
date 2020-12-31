import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/constant/env.dart';
import 'package:flutter_boilerplate/common/http/api_provider.dart';
import 'package:flutter_boilerplate/common/util/internet_check.dart';
import 'package:flutter_boilerplate/common/widget/loading_widget.dart';
import 'package:flutter_boilerplate/feature/authentication/bloc/index.dart';
import 'package:flutter_boilerplate/feature/course/model/course.dart';
import 'package:flutter_boilerplate/feature/course/ui/screen/course_screen.dart';
import 'package:flutter_boilerplate/feature/landing/splash_page.dart';
import 'package:flutter_boilerplate/feature/signin_signup/resources/auth_repository.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const LoadingWidget();
          }

          if (state is AuthenticationAuthenticated) {
            return CourseHomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return SignInPage(
                authRepository: AuthRepository(
                    env: RepositoryProvider.of<Env>(context),
                    apiProvider: RepositoryProvider.of<ApiProvider>(context),
                    internetCheck:
                        RepositoryProvider.of<InternetCheck>(context)));
          }

          return SplashPage();
        });
  }
}
