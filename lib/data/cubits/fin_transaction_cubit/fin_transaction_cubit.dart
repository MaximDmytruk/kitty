import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/data/models/financial_category/financial_category.dart';

part 'fin_transaction_state.dart';
part 'fin_transaction_cubit.freezed.dart';

class FinTransactionCubit extends Cubit<FinTransactionState> {
  FinTransactionCubit()
      : super(FinTransactionState(status: FinTransactionStatus.initial));
}
