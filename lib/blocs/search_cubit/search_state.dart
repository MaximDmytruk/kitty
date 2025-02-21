part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default([]) List<String> searchHistory,
    String? errorText,
    String? toastText,
    @Default([]) List<FinancialTransaction> transactions,
  }) = _SearchState;
}
