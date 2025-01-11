import 'package:flutter/material.dart';
import 'package:kitty/screens/home_screen/home_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import 'screens/auth_screen/auth_screen.dart';
import 'screens/registration_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: KittyColors.blue106,
        ),
      ),
      title: 'Kitty',
      routes: {
        AuthScreen.routeName: (_) => const AuthScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
      },
      initialRoute: AuthScreen.routeName,
    );
  }
}
