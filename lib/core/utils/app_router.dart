import 'package:egyptopia/features/auth/presentation/views/registration_view.dart';
import 'package:egyptopia/features/auth/presentation/views/sign_in_view.dart';
import 'package:egyptopia/features/auth/presentation/views/sign_up_view.dart';
import 'package:egyptopia/features/onbording/presentation/views/on_bording_view.dart';
import 'package:egyptopia/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBordingView = '/onBordingView';
  static const kRegistrationView = '/registrationView';
  static const kSignUp = '/signup';
  static const kSignIn = '/signin';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
        path: kRegistrationView,
        builder: (context, state) => const RegistrationView()),
    GoRoute(path: kSignUp, builder: (context, state) => const SignUpView()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignInView()),
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
