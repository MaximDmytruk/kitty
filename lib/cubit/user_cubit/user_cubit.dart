import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/model/user.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  void registerUser(
    String password,
    String email,
    String name,
  ) {
    if (state.user != null) {
      emit(
        state.copyWith(
          errorText: AppLocale.errorUserRegistered,
          status: UserStatus.error,
        ),
      );
    } else {
      User newUser = User(
        name: name,
        password: password,
        email: email,
      );
      emit(
        state.copyWith(
          user: newUser,
          status: UserStatus.authenticated,
        ),
      );
    }
  }

  void loginUser(String email, String password) {
    if (state.user == null) {
      emit(
        state.copyWith(
          errorText: "No user registered",
          status: UserStatus.error,
        ),
      );
      return;
    }

    if (state.user!.email == email && state.user!.password == password) {
      emit(
        state.copyWith(
          user: state.user,
          status: UserStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorText: "Invalid email or password",
          status: UserStatus.error,
        ),
      );
    }
  }

  void removeUser() {
    emit(
      state.copyWith(
        user: null,
        status: UserStatus.initial,
      ),
    );
  }

  void addNewCategory(FinancialCategory newCategory) {
    state.user!.categoryService.addNewCategory(newCategory);
    showToast(text: 'New category added successfully!');
    emit(
      state.copyWith(
        user: state.user,
        status: UserStatus.authenticated,
      ),
    );
  }

  void addFinancialTransaction(FinancialTransaction finTransaction) {
    if (state.user != null) {
      state.user!.finTransaction.add(finTransaction);
      emit(
        state.copyWith(
          user: state.user,
          status: UserStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
            status: UserStatus.error, errorText: 'No user registered'),
      );
    }
    print(state.user!.finTransaction.length);
  }

  String getUserName() => state.user?.name ?? 'No Name';
  String getFirstLetterName() => state.user?.name[0].toUpperCase() ?? '-';
  String getUserEmail() => state.user?.email ?? 'No Email';

  List<FinancialCategory> getFinancialCategory() {
    if (state.user != null) {
      List<FinancialCategory> categories =
          state.user!.categoryService.getCategories();

      return categories;
    } else {
      emit(
        state.copyWith(
          status: UserStatus.error,
          errorText: '"No user registered"',
        ),
      );
      List<FinancialCategory> error = [];
      return error;
    }
  }

  List<FinancialTransaction> getFinancialTransaction() {
    if (state.user != null) {
      List<FinancialTransaction> transactions = state.user!.finTransaction;
      return transactions;
    } else {
      emit(
        state.copyWith(
          status: UserStatus.error,
          errorText: '"No user registered"',
        ),
      );
      List<FinancialTransaction> error = [];
      return error;
    }
  }

  void showToast({required String text}) {
    BotToast.showCustomText(
      align: Alignment.topCenter,
      toastBuilder: (_) {
        return Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            color: ColorsApp.grey66,
            child: Text(
              text,
              style: interTextStyle(
                fontWeight: FontWeight.w500,
                color: ColorsApp.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
