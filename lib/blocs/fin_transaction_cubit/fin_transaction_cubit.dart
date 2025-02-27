import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/utils/localization/app_locale.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/repositories/fin_transaction_repository/fin_transaction_repository.dart';
import 'package:kitty/widgets/toasts/show_toast.dart';

part 'fin_transaction_state.dart';
part 'fin_transaction_cubit.freezed.dart';

class FinTransactionCubit extends Cubit<FinTransactionState> {
  final FinTransactionRepository finTransactionRepository;

  FinTransactionCubit(
    this.finTransactionRepository,
  ) : super(
          FinTransactionState(
            status: FinTransactionStatus.initial,
          ),
        );

  Future<int> getTotalAmountByDate({
    required int categoryId,
    required int month,
    required int year,
    required FinancialAction financialAction,
  }) async {
    return await finTransactionRepository.getTotalAmount(
        categoryId, month, year, financialAction);
  }

  Future<void> getTransactions({int? dateMonth, int? year}) async {
    emit(
      state.copyWith(
        status: FinTransactionStatus.loading,
      ),
    );

    List<FinancialTransaction> transactions =
        await finTransactionRepository.getAllTransactions(
      dateMonth: dateMonth,
      year: year,
    );

    emit(
      state.copyWith(
        status: FinTransactionStatus.loaded,
        transactions: transactions,
      ),
    );
  }

  Future<void> addTransaction(
    BuildContext context,
    FinancialTransaction transaction,
  ) async {
    emit(
      state.copyWith(
        status: FinTransactionStatus.loading,
      ),
    );

    finTransactionRepository.insertTransaction(
      transaction,
    );
    List<FinancialTransaction> transactions =
        await finTransactionRepository.getAllTransactions();
    emit(
      state.copyWith(
        status: FinTransactionStatus.loaded,
        transactions: transactions,
      ),
    );
   
    showToast(
      // ignore: use_build_context_synchronously
      text: AppLocale.newTransactionAddeddSuccessfully,
    );
  }


  Future<void> addTestTransactions() async {
    finTransactionRepository.insertTestTransactions();
    List<FinancialTransaction> transactions =
        await finTransactionRepository.getAllTransactions();
    emit(
      state.copyWith(
        status: FinTransactionStatus.loaded,
        transactions: transactions,
      ),
    );
  }

  Future<void> removeAllTransactions() async {
    finTransactionRepository.deleteAllTransactions();
    emit(
      state.copyWith(
        status: FinTransactionStatus.initial,
        transactions: null,
        errorText: null,
      ),
    );
  }
}
