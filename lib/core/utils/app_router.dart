<<<<<<< HEAD

import 'package:egyptopia/auth.dart';
import 'package:egyptopia/features/onbording/presentation/views/on_bording_view.dart';
import 'package:egyptopia/features/splash/presentation/views/splash_view.dart';
=======
import 'package:egyptopia/auth.dart';
import 'package:egyptopia/features/onbording/presentation/views/on_bording_view.dart';
import 'package:egyptopia/features/splash/presentation/views/splash_view.dart';
import 'package:egyptopia/signin.dart';
import 'package:egyptopia/signup.dart';
>>>>>>> feature/my-new-work
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBordingView = '/onBordingView';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/auth', builder: (context, state) => const Auth()),
<<<<<<< HEAD
=======
    GoRoute(path: '/signup', builder: (context, state) => const SignUp()),
    GoRoute(path: '/signin', builder: (context, state) => const SignIn()),
>>>>>>> feature/my-new-work
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
