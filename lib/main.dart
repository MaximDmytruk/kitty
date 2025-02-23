import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/blocs/search_cubit/search_cubit.dart';
import 'package:kitty/blocs/statistic_cubit/statisctic_cubit.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/blocs/user_cubit/user_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kitty/repositories/fin_transaction_repository/fin_transaction_repository.dart';
import 'package:kitty/repositories/financial_category_repository/fin_category_repository.dart';
import 'package:kitty/repositories/search_history_repository/search_history_repository.dart';
import 'package:kitty/repositories/user_repository/user_repository.dart';

import 'package:kitty/localization/map_lacales.dart';
import 'package:kitty/screens/add_new_category_screen/screen/add_new_category_screen.dart';
import 'package:kitty/screens/add_new_transaction/add_new_transaction_screen.dart';
import 'package:kitty/screens/manage_categories_screen/screen/manage_categories_screen.dart';
import 'package:kitty/screens/search_screen/screen/search_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import 'screens/auth_screen/auth_screen.dart';
import 'screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'screens/registration_screen/registration_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  await Hive.initFlutter();

  final SearchHistoryRepository searchHistoryRepository =
      await SearchHistoryRepository.init();

  runApp(
    MyApp(
      searchHistoryRepository: searchHistoryRepository,
    ),
  );
}

class MyApp extends StatefulWidget {
  final SearchHistoryRepository searchHistoryRepository;

  const MyApp({super.key, required this.searchHistoryRepository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final FinTransactionRepository finTransactionRepository =
      FinTransactionRepository();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(
            UserRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => DateCubit(),
        ),
        BlocProvider(
          create: (context) => FinCategoryCubit(
            FinCategoryRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => FinTransactionCubit(
            finTransactionRepository,
          ),
        ),
        BlocProvider(
          create: (context) => StatisticCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            widget.searchHistoryRepository,
            finTransactionRepository,
          ),
        ),
      ],
      child: MaterialApp(
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: ColorsApp.blue106,
          ),
        ),
        title: 'Kitty',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        routes: {
          AuthScreen.routeName: (_) => const AuthScreen(),
          RegistrationScreen.routeName: (_) => const RegistrationScreen(),
          BottomNavigationScreen.routeName: (_) =>
              const BottomNavigationScreen(),
          AddNewTransactionScreen.routeName: (_) =>
              const AddNewTransactionScreen(),
          ManageCategoriesScreen.routeName: (_) =>
              const ManageCategoriesScreen(),
          AddNewCategory.routeName: (_) => const AddNewCategory(),
          SearchScreen.routeName: (_) => const SearchScreen(),
        },
        initialRoute: AuthScreen.routeName,
      ),
    );
  }
}
