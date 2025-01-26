import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/model/user.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  User? _currentUser;

  void registerUser(
    String password,
    String email,
    String name,
  ) {
    if (_currentUser != null) {
      emit(UserState.error(AppLocale.errorUserRegistered));
      print('USER is HERE');
     
    } else {
      User newUser = User(
        name: name,
        password: password,
        email: email,
      );
      _currentUser = newUser;
      emit(UserState.authenticated(_currentUser!));
    }
  }

  void loginUser(String email, String password) {
    if (_currentUser == null) {
      emit(const UserState.error("No user registered"));
      return;
    }

    if (_currentUser!.email == email && _currentUser!.password == password) {
      emit(UserState.authenticated(_currentUser!));
    } else {
      emit(const UserState.error("Invalid email or password"));
    }
  }

  void removeUser() {
    _currentUser = null;
    emit(UserState.initial());
  }

  void addFinancialTransaction(FinancialTransaction finTransaction) {
    // emit(state.copyWith(listFinTransaction: [...state.listFinTransaction, finTransaction] ));
    _currentUser!.finTransaction.add(finTransaction);
    emit(UserState.authenticated(_currentUser!));
  }

  String getUserName() {
    return _currentUser?.name.isNotEmpty == true
        ? _currentUser!.name
        : 'No Name';
  }

  String getFirstLetterName() {
    return _currentUser?.name.isNotEmpty == true
        ? _currentUser!.name[0].toUpperCase()
        : '';
  }

  String getUserEmail() {
    return _currentUser?.email.isNotEmpty == true
        ? _currentUser!.email
        : 'No Email';
  }

  List<FinancialCategory> getFinancialCategory() {
    if (_currentUser != null) {
      List<FinancialCategory> categories =
          _currentUser!.categoryService.getCategories();

      return categories;
    } else {
      List<FinancialCategory> error = [];
      return error;
    }
  }
}
