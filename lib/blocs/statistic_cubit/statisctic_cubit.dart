import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/repositories/search_history_repository/search_history_repository.dart';

part 'statisctic_state.dart';
part 'statisctic_cubit.freezed.dart';

class StatisticCubit extends Cubit<StatisticsState> {
  StatisticCubit()
      : super(
          StatisticsState(
            status: StatisticsStatus.initial,
          ),
        );

  Future<void> calculateCategory(
    List<FinancialCategory> categories,
    int month,
    int year,
    FinTransactionCubit transactionCubit,
  ) async {
    emit(
      state.copyWith(
        status: StatisticsStatus.loading,
      ),
    );

    try {
      Map<int, int> categoryTotalAmount = {};
      int overallTotal = 0;
      Map<int, Color> categoryColors = {};

      for (FinancialCategory category in categories) {
        final int totalAmount = await transactionCubit.getTotalAmountByMonth(
          categoryId: category.id!,
          month: month,
          year: year,
        );
        categoryTotalAmount[category.id!] = totalAmount;
        overallTotal += totalAmount;
        categoryColors[category.id!] = category.colorValue;
      }

      Map<int, double> categoryPercentages = {};
      if (overallTotal > 0) {
        categoryTotalAmount.forEach(
          (id, amount) {
            categoryPercentages[id] = (amount / overallTotal) * 100;
          },
        );
      }

      emit(state.copyWith(
        status: StatisticsStatus.loaded,
        categoryTotalAmount: categoryTotalAmount,
        categoryPercentages: categoryPercentages,
        categoryColors: categoryColors,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: StatisticsStatus.error,
        errorText: e.toString(),
      ));
    }
  }
}
