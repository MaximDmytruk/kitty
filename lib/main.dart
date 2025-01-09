import 'package:flutter/material.dart';

import 'screens/auth_screen/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitty',
      routes: {
        AuthScreen.routeName: (_) => const AuthScreen(),
      },
      initialRoute: AuthScreen.routeName,
    );
  }
}
