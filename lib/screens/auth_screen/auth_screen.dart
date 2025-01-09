import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import '../../widgets/feeled_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void buttonAction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FeeledButton(
          name: 'Button',
          onPressed: buttonAction,
        ),
      ),
    );
  }
}
