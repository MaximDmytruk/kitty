import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/TEST/testTransaction.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/services/category_service.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/styles/icons/icons_app.dart';

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
