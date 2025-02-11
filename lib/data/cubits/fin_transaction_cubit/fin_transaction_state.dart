part of 'fin_transaction_cubit.dart';

enum FinTransactionStatus {
  initial,
  loaded,
  error,
  showToast,
  loading,
}

@freezed
class FinTransactionState with _$FinTransactionState {
  const factory FinTransactionState({
    @Default(FinTransactionStatus.initial) FinTransactionStatus status,
    List<FinancialCategory>? categories,
    String? errorText,
    String? toastText,
  }) = _FinTransactionState;
}
