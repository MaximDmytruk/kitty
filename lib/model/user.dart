import 'package:kitty/model/financial_transaction.dart';

class User {
  final String name;
  final String password;
  final String email;

  User({
    required this.name,
    required this.password,
    required this.email,
  });

  List<FinancialTransaction> finTransaction = [];
}
