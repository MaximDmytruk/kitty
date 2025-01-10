import 'package:flutter/material.dart';
import 'package:kitty/screens/home_screen/home_screen.dart';

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
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: AuthScreen.routeName,
    );
  }
}
