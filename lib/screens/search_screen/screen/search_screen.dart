import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/screens/search_screen/widgets/search_app_bar.dart';
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

  void historyNameAction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: BlocBuilder<FinCategoryCubit, FinCategoryState>(
        builder: (context, state) {
          List<FinancialCategory> categories = state.categories ?? [];
          return Column(
            children: [
              CustomStatusBar(),
              SearchAppBar(
                textController: searchTextController,
                categories: categories,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 20.0,
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: historyNameAction,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsApp.history,
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            'History',
                            style: interTextStyle(),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            IconsApp.northWestArrow,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
