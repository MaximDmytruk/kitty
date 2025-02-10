part of 'date_cubit.dart';

enum DateStatus {
  initial,
  updateYear,
  updateMonth,
  updateDate,
  loaded,
}

@freezed
class DateState with _$DateState {
  const factory DateState({
    @Default(DateStatus.initial) DateStatus status,
    String? errorText,
    required int selectedYear,
    required int selectedMonth,
  }) = _DateState;
}
