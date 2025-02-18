import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/color_strip_painter/color_strip_painter.dart';
import 'package:kitty/screens/statistics_screen/widgets/category_result_item.dart';
import 'package:kitty/screens/statistics_screen/widgets/name_of_section.dart';
import 'package:kitty/styles/icons/icons_app.dart';
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

  @override
  void initState() {
    final stateDate = context.read<DateCubit>().state;
    _loadCategories(stateDate);
    super.initState();
  }

  Future<void> _calculateCategory(DateState stateDate) async {
    categoryTotalAmount.clear();
    categoryPercentages.clear();
    int overallTotal = 0;

    for (FinancialCategory category in financialCategories) {
      int totalAmount =
          await context.read<FinTransactionCubit>().getTotalAmountByMonth(
                categoryId: category.id!,
                month: stateDate.selectedMonth,
              );
      categoryTotalAmount[category.id!] = totalAmount;
      overallTotal += totalAmount;
      categoryColors[category.id!] = category.colorValue;
    }

    if (overallTotal > 0) {
      categoryTotalAmount.forEach((categoryId, categoryTotal) {
        double percentage = (categoryTotal / overallTotal) * 100;
        categoryPercentages[categoryId] = percentage;
      });
    }

    setState(() {});
  }

  void _loadCategories(DateState stateDate) {
    financialCategories =
        context.read<FinCategoryCubit>().state.categories ?? [];

    _calculateCategory(stateDate);
  }

  void _downloadReportAction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: BlocBuilder<DateCubit, DateState>(
        builder: (context, stateDate) {
          return BlocBuilder<FinTransactionCubit, FinTransactionState>(
            builder: (context, stateTransaction) {
              print('');
              print(categoryPercentages);
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: CustomPaint(
                            size: Size(double.infinity, 36),
                            painter: ColorStripPainter(
                              colors: categoryColors.values.toList(),
                              percentages: categoryPercentages.values.toList(),
                            ),
                          )),
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
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
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 8.0,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            FinancialCategory category =
                                financialCategories[index];
                            int totalAmount =
                                categoryTotalAmount[category.id!] ?? 0;
                            double percentage =
                                categoryPercentages[category.id!] ?? 0;

                            print('TOTAL in widgety = $totalAmount');
                            print('TOTAL  percwnte in widget = $percentage');

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
                      onPressed: _downloadReportAction,
                      name: AppLocale.download.getString(context),
                      icon: SvgPicture.asset(IconsApp.download),
                    ),
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
