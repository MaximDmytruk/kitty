import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/cubit/user_cubit.dart';
import 'package:kitty/localization/map_lacales.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import 'screens/auth_screen/auth_screen.dart';
import 'screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'screens/registration_screen/registration_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(
     MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  
  @override
  void initState() {
    _localization.init(
      mapLocales: getMapLocales(),
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> UserCubit(),
      child: MaterialApp(
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: KittyColors.blue106,
          ),
        ),
        title: 'Kitty',
        routes: {
          AuthScreen.routeName: (_) => const AuthScreen(),
          RegistrationScreen.routeName: (_) => const RegistrationScreen(),
          BottomNavigationScreen.routeName: (_) => const BottomNavigationScreen(),
        },
        initialRoute: AuthScreen.routeName,
      ),
    );
  }
}

