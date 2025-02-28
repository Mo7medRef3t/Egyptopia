import 'package:egyptopia/features/z/activities.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/create_new_password.dart';
import 'package:egyptopia/features/z/events.dart';
import 'package:egyptopia/features/z/food.dart';
import 'package:egyptopia/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:egyptopia/features/auth/presentation/views/registration_view.dart';
import 'package:egyptopia/features/auth/presentation/views/sign_in_view.dart';
import 'package:egyptopia/features/auth/presentation/views/sign_up_view.dart';
import 'package:egyptopia/features/home/presentation/views/widgets/home_body.dart';
import 'package:egyptopia/features/z/quiz_level.dart';
import 'package:egyptopia/features/z/quiz_results.dart';
import 'package:egyptopia/features/z/quiz_screen.dart';
import 'package:egyptopia/features/z/quizzes.dart';
import 'package:egyptopia/features/z/places.dart';
import 'package:egyptopia/features/onbording/presentation/views/on_bording_view.dart';
import 'package:egyptopia/features/splash/presentation/views/splash_view.dart';
import 'package:egyptopia/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBordingView = '/onBordingView';
  static const kRegistrationView = '/registrationView';
  static const kSignUp = '/signup';
  static const kSignIn = '/signin';
  static const kForgetPassword = '/forgetPassword';
  static const kCreateNewPassword = '/createNewPassword';
  static const kScreens = '/screens';
  static const kHomePage = '/home';
  static const kPlaces = '/places';
  static const kQuizzes = '/quizzes';
  static const kEvents = '/events';
  static const kFood = '/food';
  static const kActivities = '/activities';
  static const kQuizLevels = '/quizLevel';
  static const kQuizResults = '/quizResults';

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
    GoRoute(
        path: kCreateNewPassword,
        builder: (context, state) => const CreateNewPassword()),
    GoRoute(path: kScreens, builder: (context, state) => const Screens()),
    GoRoute(path: kHomePage, builder: (context, state) => const HomeBody()),
    GoRoute(path: kPlaces, builder: (context, state) => const Places()),
    GoRoute(path: kQuizzes, builder: (context, state) => const Quizzes()),
    GoRoute(path: kEvents, builder: (context, state) => const Events()),
    GoRoute(path: kFood, builder: (context, state) => const Food()),
    GoRoute(path: kActivities, builder: (context, state) => const Activities()),
    GoRoute(path: kQuizLevels, builder: (context, state) => const QuizLevels()),
    GoRoute(
      path: '/quiz/:level',
      builder: (context, state) {
        String level = state.pathParameters['level'] ?? 'beginner';
        return QuizScreen(level: level);
      },
    ),
    GoRoute(
      path: kQuizResults,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        int score = extra?['score'] ?? 0;
        int totalQuestions = extra?['totalQuestions'] ?? 1;
        return QuizResultsScreen(score: score, totalQuestions: totalQuestions);
      },
    ),
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
