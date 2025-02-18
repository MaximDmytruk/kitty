import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/screens/search_screen/widgets/search_app_bar.dart';
import 'package:kitty/styles/colors/colors_app.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: Column(
        children: [
          CustomStatusBar(),
          BlocBuilder<FinCategoryCubit, FinCategoryState>(
            builder: (context, state) {
              List<FinancialCategory> categories = state.categories ?? [];
              return SearchAppBar(
                textController: searchTextController,
                categories: categories,
              );
            },
          ),
        ],
      ),
    );
  }
}
