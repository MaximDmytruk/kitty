part of 'statisctic_cubit.dart';

enum StatisticsStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(StatisticsStatus.initial) StatisticsStatus status,
    @Default({}) Map<int, int> categoryTotalAmount,
    @Default({}) Map<int, double> categoryPercentages,
    @Default({}) Map<int, Color> categoryColors,
    String? errorText,
  }) = _StatisticsState;
}