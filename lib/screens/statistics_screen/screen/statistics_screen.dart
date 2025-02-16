import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/screens/statistics_screen/widgets/category_result_item.dart';
import 'package:kitty/screens/statistics_screen/widgets/name_of_section.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/testing/testing_transaction.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/app_bars/name_of_screen_header.dart';
import 'package:kitty/widgets/date_picker/custom_date_picker.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<FinancialCategory> financialCategories = [];
  int totalAmount = 0;
  void dowloadReportActiom() {}
  Map<int, int> categoryTotalAmount = {}; //щоб зберігати суми певної категоріїї
  Map<int, double> categoryPercentages = {}; //відсотки категорій

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchTotalAmounts(DateState stateDate) async {
    categoryTotalAmount.clear();
    categoryPercentages.clear();
    int overallTotal = 0;

    for (FinancialCategory category in financialCategories) {
      final int totalAmount = await context
          .read<FinTransactionCubit>()
          .getTotalAmountByMonth(
              categoryId: category.id!, month: stateDate.selectedMonth);

      categoryTotalAmount[category.id!] = totalAmount;
      overallTotal += totalAmount;
    }

    if (overallTotal > 0) {
      for (var category in categoryTotalAmount.entries) {
        double percentage = (category.value / overallTotal) * 100;
        categoryPercentages[category.key] = percentage;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: BlocBuilder<DateCubit, DateState>(
        builder: (context, stateDate) {
          return BlocBuilder<FinCategoryCubit, FinCategoryState>(
            builder: (context, stateCategory) {
              financialCategories = stateCategory.categories ?? [];
              fetchTotalAmounts(stateDate);

              return BlocBuilder<FinTransactionCubit, FinTransactionState>(
                builder: (context, stateTransaction) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomStatusBar(),
                          NameOfScreenHeader(
                            name: AppLocale.statistics.getString(context),
                            color: ColorsApp.white,
                          ),
                          CustomDatePicker(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: NameOfSection(
                              name: AppLocale.overview.getString(context),
                            ),
                          ),
                          //TODO: Кольоровий графік
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Container(
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(248, 187, 207, 1),
                              ),
                              child: Text('asdsad'),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: NameOfSection(
                              name: AppLocale.detail.getString(context),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              itemCount: financialCategories.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 8.0,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                FinancialCategory category =
                                    financialCategories[index];
                                int totalAmount =
                                    categoryTotalAmount[category.id!] ?? 0;
                                    double percentage = categoryPercentages[category.id!] ?? 0;
                                return CategoryResultItem(
                                  category: category,
                                  totalAmount: totalAmount,
                                  percentage: percentage,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                        ),
                        child: CustomFeeledButton(
                          onPressed: dowloadReportActiom,
                          name: AppLocale.download.getString(context),
                          icon: SvgPicture.asset(IconsApp.download),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
