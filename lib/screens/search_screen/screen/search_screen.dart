import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/search_cubit/search_cubit.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/screens/search_screen/widgets/history_list_view.dart';
import 'package:kitty/screens/search_screen/widgets/search_app_bar.dart';
import 'package:kitty/screens/search_screen/widgets/search_history_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = '/search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    context.read<SearchCubit>().getSearchHistory();
    super.initState();
  }

  void onSubmitted(String value) {
    context.read<SearchCubit>().saveSearchQuery(value);
  }

  void historyNameAction(String name) {
    searchTextController.text = name;
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: BlocBuilder<FinCategoryCubit, FinCategoryState>(
        builder: (context, stateCategory) {
          List<FinancialCategory> categories = stateCategory.categories ?? [];
          return BlocBuilder<SearchCubit, SearchState>(
            builder: (context, stateSearch) {
              List<String> searchHistory = stateSearch.searchHistory ?? [];
              return Column(
                children: [
                  CustomStatusBar(),
                  SearchAppBar(
                    textController: searchTextController,
                    categories: categories,
                    onSubmitted: onSubmitted,
                  ),
                  HistoryListView(
                    searchHistory: searchHistory,
                    onTap: historyNameAction,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
