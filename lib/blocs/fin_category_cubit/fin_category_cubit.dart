import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/utils/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/repositories/financial_category_repository/fin_category_repository.dart';
import 'package:kitty/widgets/toasts/show_toast.dart';

part 'fin_category_state.dart';
part 'fin_category_cubit.freezed.dart';

class FinCategoryCubit extends Cubit<FinCategoryState> {
  final FinCategoryRepository repository;

  FinCategoryCubit(
    this.repository,
  ) : super(
          FinCategoryState(
            status: FinCategoryStatus.initial,
          ),
        );

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

  Future<void> updateCategory(
    BuildContext context,
    FinancialCategory updateCategory,
  ) async {
    await repository.updateCategory(updateCategory);
    List<FinancialCategory> categories = await repository.getAllCategories();
    emit(
      state.copyWith(
        status: FinCategoryStatus.loaded,
        categories: categories,
      ),
    );
    
    
    showToast(text: AppLocale.categoryEdited);
  }

  Future<void> addCategory(
      BuildContext context, FinancialCategory category) async {
    emit(state.copyWith(status: FinCategoryStatus.loading));

    await repository.addNewCategory(category);

    List<FinancialCategory> categories = await repository.getAllCategories();

    emit(
      state.copyWith(status: FinCategoryStatus.loaded, categories: categories),
    );
    showToast(text: AppLocale.newCategoryAddeddSuccessfully);
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

  Future<void> removeAllCategories() async {
    emit(state.copyWith(status: FinCategoryStatus.loading));
    repository.deleteAllCategories();
    emit(
      state.copyWith(
        categories: null,
        status: FinCategoryStatus.initial,
        errorText: null,
      ),
    );
  }
}
