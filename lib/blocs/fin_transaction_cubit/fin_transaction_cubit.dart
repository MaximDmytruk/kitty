import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/database/database.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/repositories/fin_transaction_repository/fin_transaction_repository.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<void> getTransactions({
    int? dateMonth,
  }) async {
    emit(
      state.copyWith(
        status: FinTransactionStatus.loading,
      ),
    );

    List<FinancialTransaction> transactions =
        await finTransactionRepository.getAllTransactions(
      dateMonth: dateMonth,
    );
    emit(
      state.copyWith(
        status: FinTransactionStatus.loaded,
        transactions: transactions,
      ),
    );
  }

  Future<void> addTransaction(
    FinancialTransaction transaction,
  ) async {
    emit(
      state.copyWith(
        status: FinTransactionStatus.loading,
      ),
    );

    await finTransactionRepository.insertTransaction(
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
  }

//TODO: TESTING TRANSACTIONS
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
}
