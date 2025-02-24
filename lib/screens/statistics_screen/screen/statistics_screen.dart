import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/statistic_cubit/statisctic_cubit.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/color_strip_painter/color_strip_painter.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/screens/statistics_screen/widgets/category_result_item.dart';
import 'package:kitty/screens/statistics_screen/widgets/name_of_section.dart';
import 'package:kitty/services/get_report_in_pdf.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/app_bars/name_of_screen_header.dart';
import 'package:kitty/widgets/date_picker/custom_date_picker.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  List<FinancialCategory> financialCategories = [];
  int totalAmount = 0;

  Map<int, int> categoryTotalAmount = {};
  Map<int, double> categoryPercentages = {};
  Map<int, Color> categoryColors = {};

  void _downloadReportAction(
    // List<FinancialTransaction> transactions,
    int? month,
    int? year,
  ) async {
    await context.read<FinTransactionCubit>().getTransactions(
          dateMonth: month,
          year: year,
        );
    List<FinancialTransaction> transactions =
        context.read<FinTransactionCubit>().state.transactions ?? [];

    getReportInPdf(transactions: transactions, month: month, year: year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: BlocBuilder<DateCubit, DateState>(
        builder: (
          context,
          stateDate,
        ) {
          financialCategories =
              context.read<FinCategoryCubit>().state.categories ?? [];
          return BlocBuilder<FinTransactionCubit, FinTransactionState>(
            builder: (
              context,
              stateTransactions,
            ) {
              context.read<StatisticCubit>().calculateCategory(
                    financialCategories,
                    stateDate.selectedMonth,
                    stateDate.selectedYear,
                    context.read<FinTransactionCubit>(),
                  );

              return BlocBuilder<StatisticCubit, StatisticsState>(
                builder: (context, stateStatistic) {
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomPaint(
                              size: Size(
                                double.infinity,
                                36,
                              ),
                              painter: ColorStripPainter(
                                colors: stateStatistic.categoryColors.values
                                        .toList()
                                        .isEmpty
                                    ? [Colors.amber]
                                    : stateStatistic.categoryColors.values
                                        .toList(),
                                percentages: stateStatistic
                                    .categoryPercentages.values
                                    .toList(),
                              ),
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
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              itemCount: financialCategories.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 8.0);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                FinancialCategory category =
                                    financialCategories[index];
                                int totalAmount = stateStatistic
                                        .categoryTotalAmount[category.id!] ??
                                    0;
                                double percentage = stateStatistic
                                        .categoryPercentages[category.id!] ??
                                    0;
                                return CategoryResultItem(
                                  category: financialCategories[index],
                                  totalAmount: totalAmount,
                                  percentage: percentage,
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      //Button: Download Report
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                        ),
                        child: CustomFeeledButton(
                          onPressed: () {
                            _downloadReportAction(
                              stateDate.selectedMonth,
                              stateDate.selectedYear,
                            );
                            // final simplePdfFile =
                            //     await SimplePdfApi.generateSimpleTextPdf(
                            //         'Sometext', 'Sometext');
                            // SaveAndOpenDocument.openPdf(simplePdfFile);
                          },
                          name: AppLocale.download.getString(context),
                          icon: SvgPicture.asset(
                            IconsApp.download,
                          ),
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
    );
  }
}
