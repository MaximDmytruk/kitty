part of 'search_cubit.dart';

enum SearchStatus {
  initial,
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    String? errorText,
    String? toastText,
  }) = _SearchState;
}
