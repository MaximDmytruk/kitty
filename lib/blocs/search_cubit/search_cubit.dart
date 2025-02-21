import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/repositories/search_history_repository/search_history_repository.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchHistoryRepository repository;

  SearchCubit(this.repository)
      : super(
          SearchState(status: SearchStatus.initial),
        );

  void getSearchHistory() {
    emit(state.copyWith(status: SearchStatus.loading));

    List<String> searchHistory = repository.getSearchHistory();

    emit(
      state.copyWith(
        status: SearchStatus.loaded,
        searchHistory: searchHistory,
      ),
    );
  }

  void saveSearchQuery(String query) {
    emit(state.copyWith(status: SearchStatus.loading));

    if (query != '') {
      repository.addSearchQuery(query);
      getSearchHistory();
    } else {
      emit(
        state.copyWith(
          status: SearchStatus.error,
          errorText: 'Please enter query',
        ),
      );
    }
  }
}
