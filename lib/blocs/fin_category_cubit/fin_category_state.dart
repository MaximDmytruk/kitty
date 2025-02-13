part of 'fin_category_cubit.dart';

enum FinCategoryStatus {
  initial,
  loaded,
  error,
  showToast,
  loading,
}

@freezed
class FinCategoryState with _$FinCategoryState {
  const factory FinCategoryState({
    @Default(FinCategoryStatus.initial) FinCategoryStatus status,
    List<FinancialCategory>? categories,
    String? errorText,
    String? toastText,
  }) = _FinCategoryState;
}
