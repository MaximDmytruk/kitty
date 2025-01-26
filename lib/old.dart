// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kitty/models/financial_transaction.dart';
// import 'package:kitty/models/user.dart';

// class UserCubit extends Cubit<User?> {
//   UserCubit() : super(null);

  // void registerUser(
  //   String password,
  //   String email,
  //   String name,
  // ) {
  //   emit(User(
  //     password: password,
  //     email: email,
  //     name: name,
  //   ));
  // }

//   bool loginUser(String email, String password) {
//     if (state == null) return false;

//     if (state!.email == email && state!.password == password) {
//       emit(state);
//       return true;
//     }
//     return false;
//   }

//   void addFinancialTransaction(FinancialTransaction finTransaction){
  
//     // emit(state.copyWith(listFinTransaction: [...state.listFinTransaction, finTransaction] ));
//   }
// }



// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'financial_transaction.dart';

// part 'user.freezed.dart';
// part 'user.g.dart';

// @freezed
// class User with _$User {
//   const factory User({
//     required String name,
//     required String email,
//     required String password,
//   }) = _User;

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }