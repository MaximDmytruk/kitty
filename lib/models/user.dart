import 'package:kitty/services/category_service.dart';
import 'package:kitty/models/financial_transaction.dart';
import 'package:kitty/testing/testing_transaction.dart';

class User {
  final String name;
  final String password;
  final String email;
  
  User({
    required this.name,
    required this.password,
    required this.email,
  });
   
  // List<FinancialTransaction> finTransaction = [];
  List<FinancialTransaction> finTransaction = testingTransaction;
  
  CategoryService categoryService = CategoryService();
}

class Wallet {
  void gettransc({
    bool refresh = false,
    String? title = null,
  }) {
    List<FinancialTransaction> lsiTrans =
        []; //SQLSERVICE.gettransaction(title, refresh)
  }
}

class wallstate {
  List<FinancialTransaction> finTransaction = [];
}





