import 'package:egyptopia/features/auth/presentation/views/widgets/registration_body.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationBody(),
    );
  }
}
