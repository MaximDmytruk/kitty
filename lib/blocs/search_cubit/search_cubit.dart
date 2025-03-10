import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/repositories/fin_transaction_repository/fin_transaction_repository.dart';
import 'package:kitty/repositories/search_history_repository/search_history_repository.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchHistoryRepository historyRepository;
  final FinTransactionRepository finTransactionRepository;

  SearchCubit(this.historyRepository, this.finTransactionRepository)
      : super(
          SearchState(status: SearchStatus.initial),
        );

  Future<void> searchTransactions({
    required String query,
    List<int>? categoryIds,
  }) async {
    emit(
      state.copyWith(
        status: SearchStatus.loading,
      ),
    );
    List<FinancialTransaction> transactions =
        await finTransactionRepository.searchTransactions(
      query: query,
      categoriesId: categoryIds,
    );
    emit(
      state.copyWith(
        status: SearchStatus.loaded,
        transactions: transactions,
      ),
    );
  }

  void getSearchHistory() {
    emit(
      state.copyWith(
        status: SearchStatus.loading,
      ),
    );
    List<String> searchHistory = historyRepository.getSearchHistory();
    emit(
      state.copyWith(
        status: SearchStatus.loaded,
        searchHistory: searchHistory,
      ),
    );
  }

  void saveSearchQuery(
    String query,
  ) {
    emit(
      state.copyWith(
        status: SearchStatus.loading,
      ),
    );
    if (query != '') {
      historyRepository.addSearchQuery(
        query,
      );
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

  void removeSearchQuery(String query) {
    historyRepository.removeSearchQuery(query);
    getSearchHistory();
  }

  void removeAllHistory() {
    historyRepository.clearSearchHistory();
    emit(
      state.copyWith(
        status: SearchStatus.initial,
        searchHistory: [],
        errorText: null,
      ),
    );
  }
}
