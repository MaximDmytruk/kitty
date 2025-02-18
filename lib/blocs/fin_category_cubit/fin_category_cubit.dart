import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/repositories/financial_category_repository/fin_category_repository.dart';

part 'fin_category_state.dart';
part 'fin_category_cubit.freezed.dart';

class FinCategoryCubit extends Cubit<FinCategoryState> {
  final FinCategoryRepository repository;

  FinCategoryCubit(this.repository)
      : super(FinCategoryState(status: FinCategoryStatus.initial));

  Future<void> getFinancialCategories() async {
    List<FinancialCategory> categories = await repository.getAllCategories();

    if (categories.isNotEmpty) {
      emit(
        state.copyWith(
          status: FinCategoryStatus.loaded,
          categories: categories,
        ),
      );
    } else if (state.status == FinCategoryStatus.initial) {
      repository.initDefaultCategories();
      categories = await repository.getAllCategories();
      emit(
        state.copyWith(
          status: FinCategoryStatus.loaded,
          categories: categories,
        ),
      );
    }
  }

  Future<void> updateCategory(FinancialCategory updateCategory) async {
    await repository.updateCategory(updateCategory);
    List<FinancialCategory> categories = await repository.getAllCategories();
    emit(
      state.copyWith(status: FinCategoryStatus.loaded, categories: categories),
    );
  }

  Future<void> addCategory(FinancialCategory category) async {
    emit(state.copyWith(status: FinCategoryStatus.loading));

    await repository.addNewCategory(category);

    List<FinancialCategory> categories = await repository.getAllCategories();

    emit(
      state.copyWith(status: FinCategoryStatus.loaded, categories: categories),
    );
  }

  Future<void> changePosition(int oldIndex, int newIndex) async {
    emit(state.copyWith(status: FinCategoryStatus.loading));

    if (state.categories != null && state.categories!.isNotEmpty) {
      List<FinancialCategory> currentCategories = state.categories!.toList();

      if (newIndex > oldIndex) {
        newIndex -= 1;
      }

      FinancialCategory item = currentCategories.removeAt(oldIndex);
      currentCategories.insert(newIndex, item);

      List<FinancialCategory> updatedCategories = currentCategories
          .asMap()
          .entries
          .map((e) => e.value.copyWith(position: e.key))
          .toList();

      repository.updatePositions(updatedCategories);
      emit(
        state.copyWith(
          status: FinCategoryStatus.loaded,
          categories: updatedCategories,
        ),
      );
    }
  }
}
