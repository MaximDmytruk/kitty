import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/cubit/statisctic_cubit.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/color_strip_painter/color_strip_painter.dart';
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

  Map<int, int> categoryTotalAmount = {}; //суми певної категоріїї
  Map<int, double> categoryPercentages = {}; //відсотки категорій
  Map<int, Color> categoryColors = {}; //Кольори категорій

  void _downloadReportAction() {}

  // Future<void> _calculateCategory(DateState stateDate) async {
  //   // categoryTotalAmount.clear();
  //   // categoryPercentages.clear();
  //   int overallTotal = 0;

  //   for (FinancialCategory category in financialCategories) {
  //     final int totalAmount =
  //         await context.read<FinTransactionCubit>().getTotalAmountByMonth(
  //               categoryId: category.id!,
  //               month: stateDate.selectedMonth,
  //             );
  //     print('TOTAL AMOUNT = $totalAmount in Category ID = ${category.id}');
  //     categoryTotalAmount[category.id!] = totalAmount;
  //     overallTotal += totalAmount;

  //     print(categoryTotalAmount.entries);
  //   }
  //   setState(() {

  //   });
  // }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: ColorsApp.white,
    body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BlocBuilder<DateCubit, DateState>(
          builder: (context, stateDate) {
            financialCategories = context.read<FinCategoryCubit>().state.categories ?? [];

            return BlocBuilder<FinTransactionCubit, FinTransactionState>(
              builder: (context, stateTransactions) {
                context.read<StatiscticCubit>().calculateCategory(
                  financialCategories,
                  stateDate.selectedMonth,
                  context.read<FinTransactionCubit>(),
                );

                return BlocBuilder<StatiscticCubit, StatisticsState>(
                  builder: (context, state) {
                    return Column(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomPaint(
                            size: Size(double.infinity, 36),
                            painter: ColorStripPainter(
                              colors: state.categoryColors.values.toList().isEmpty
                                  ? [Colors.amber]
                                  : state.categoryColors.values.toList(),
                              percentages: state.categoryPercentages.values.toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: NameOfSection(
                            name: AppLocale.detail.getString(context),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            itemCount: financialCategories.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 8.0);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              FinancialCategory category = financialCategories[index];
                              int totalAmount = state.categoryTotalAmount[category.id!] ?? 0;
                              double percentage = state.categoryPercentages[category.id!] ?? 0;

                              return CategoryResultItem(
                                category: financialCategories[index],
                                totalAmount: totalAmount,
                                percentage: percentage,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomFeeledButton(
            onPressed: _downloadReportAction,
            name: AppLocale.download.getString(context),
            icon: SvgPicture.asset(IconsApp.download),
          ),
        ),
      ],
    ),
  );
}

}
