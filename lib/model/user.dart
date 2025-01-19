import 'package:kitty/model/financial_transaction.dart';

class User {
  final String name;
  final String email;
  final String password;

  User(
    this.password, {
    required this.email,
    required this.name,
  });

  List<FinancialTransaction> listFinTransaction = [];
}

// part 'user.freezed.dart';
// part 'user.g.dart';
 
 
// @freezed
// class User with _$User{

//   const factory User({
//     required String firstName,
//     required String lastName,
//     required int age,
//   }) = _User;

// }