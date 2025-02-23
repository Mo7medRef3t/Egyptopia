import 'package:egyptopia/features/auth/presentation/views/widgets/activities.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/events.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/food.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:egyptopia/features/auth/presentation/views/registration_view.dart';
import 'package:egyptopia/features/auth/presentation/views/sign_in_view.dart';
import 'package:egyptopia/features/auth/presentation/views/sign_up_view.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/home_body.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/quizzes.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/places.dart';
import 'package:egyptopia/features/onbording/presentation/views/on_bording_view.dart';
import 'package:egyptopia/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBordingView = '/onBordingView';
  static const kRegistrationView = '/registrationView';
  static const kSignUp = '/signup';
  static const kSignIn = '/signin';
  static const kForgetPassword = '/forgetPassword';
  static const kHomePage = '/home';
  static const kPlaces = '/places';
  static const kQuizzes = '/quizzes';
  static const kEvents = '/events';
  static const kFood = '/food';
  static const kActivities = '/activities';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
        path: kRegistrationView,
        builder: (context, state) => const RegistrationView()),
    GoRoute(path: kSignUp, builder: (context, state) => const SignUpView()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignInView()),
    GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPassword()),
    GoRoute(path: kHomePage, builder: (context, state) => const HomePage()),
    GoRoute(path: kPlaces, builder: (context, state) => const Places()),
    GoRoute(path: kQuizzes, builder: (context, state) => const Quizzes()),
    GoRoute(path: kEvents, builder: (context, state) => const Events()),
    GoRoute(path: kFood, builder: (context, state) => const Food()),
    GoRoute(path: kActivities, builder: (context, state) => const Activities()),
    GoRoute(
      path: kOnBordingView,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const OnBordingView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
  ]);
}
