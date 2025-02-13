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
    emit(state.copyWith(status: FinCategoryStatus.loading));

    List<FinancialCategory> categories = await repository.getAllCategories();

    if (categories.isNotEmpty) {
      print('NOT FIRST');
      emit(
        state.copyWith(
          status: FinCategoryStatus.loaded,
          categories: categories,
        ),
      );
    } else {
      print('First Enter');
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

  // void addNewCategory(FinancialCategory category) async {
  //   emit(state.copyWith(status: FinCategoryStatus.loading));
  //   FinancialCategory categoryWithPosition =
  //       category.copyWith(position: state.categories!.length + 1);

  //   await repository.addNewCategory(categoryWithPosition);

  //   List<FinancialCategory> updatedCategories =
  //       await repository.getFinancialCategories();

  //   emit(
  //     state.copyWith(
  //       status: FinCategoryStatus.loaded,
  //       categories: updatedCategories,
  //     ),
  //   );
  // }
  // Future<void> addCategory(FinancialCategory category) async {
  //   emit(state.copyWith(status: FinCategoryStatus.loading));

  //   await repository.addNewCategory(category);
  //   List<FinancialCategory> categories = await repository.getAllCategories();
  //   emit(
  //     state.copyWith(status: FinCategoryStatus.loaded, categories: categories),
  //   );
  // }

  Future<void> addCategory(FinancialCategory category) async {
    emit(state.copyWith(status: FinCategoryStatus.loading));

    final FinancialCategory savedCategory =
        await repository.addNewCategory(category);

    print('savedCategory haveId -  ${savedCategory.id}');

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

  // void changePosition(int oldIndex, int newIndex) async {
  //   emit(state.copyWith(status: FinCategoryStatus.loading));

  //   if (state.categories != null && state.categories!.isNotEmpty) {
  //     List<FinancialCategory> updatedCategories = state.categories!.toList();

  //     if (oldIndex < newIndex) {
  //       newIndex -= 1;
  //     }

  //     FinancialCategory item = updatedCategories.removeAt(oldIndex);
  //     updatedCategories.insert(newIndex, item);

  //     for (int i = 0; i < updatedCategories.length; i++) {
  //       updatedCategories[i] = updatedCategories[i].copyWith(position: i);
  //       // await repository.updateCategory(updatedCategories[i]);
  //     }

  //     emit(
  //       state.copyWith(
  //         status: FinCategoryStatus.loaded,
  //         categories: updatedCategories,
  //       ),
  //     );
  //   }
  // }
}
