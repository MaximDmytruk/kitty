import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/search_cubit/search_cubit.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/screens/search_screen/widgets/history_list_view.dart';
import 'package:kitty/screens/search_screen/widgets/search_app_bar.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/utils/filteredTransactionsByDay.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import 'package:kitty/widgets/list_views/custom_list_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = '/search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchTextController = TextEditingController();
  bool isQueryEmpty = true;
  List<List<FinancialTransaction>> transactionOfDay = [];

  @override
  void initState() {
    context.read<SearchCubit>().getSearchHistory();
    searchTextController.addListener(
      () {
        final query = searchTextController.text;

        setState(
          () {
            isQueryEmpty = searchTextController.text.isEmpty;
          },
        );
        if (query.isNotEmpty) {
          context.read<SearchCubit>().searchTransactions(
                query: query,
              );
        }
      },
    );
    super.initState();
  }

  void onSubmitted(String value, List<int> selectedCategories) {
    context.read<SearchCubit>().searchTransactions(
          query: value,
          categoryIds: selectedCategories,
        );

    context.read<SearchCubit>().saveSearchQuery(
          value,
        );
  }

  void historyNameAction(String name) {
    searchTextController.text = name;
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
  }

  @override
  void dispose() {
    // searchTextController.dispose();
    super.dispose();
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
              List<String> searchHistory = stateSearch.searchHistory;
              List<List<FinancialTransaction>> transactionOfDay = [];
              transactionOfDay = filteredTransactionsByDay(
                stateSearch.transactions,
              );
              return Column(
                children: [
                  CustomStatusBar(),
                  SearchAppBar(
                    textController: searchTextController,
                    categories: categories,
                    onSubmitted: onSubmitted,
                  ),
                  isQueryEmpty
                      ? HistoryListView(
                          searchHistory: searchHistory,
                          onTap: historyNameAction,
                        )
                      : CustomListView(
                          transactionOfDay: transactionOfDay,
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
