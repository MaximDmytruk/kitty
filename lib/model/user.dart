import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/services/category_service.dart';
import 'package:kitty/model/financial_transaction.dart';
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

  List<FinancialTransaction> finTransaction = [
    FinancialTransaction(
      financialAction: FinancialAction.expense,
      category: FinancialCategory(
        'Somne New',
        Colors.black,
        SvgPicture.asset(IconsApp.addPlusCircle),
      ),
      amount: 35,
      date: DateTime.now(),
    ),
    
    // FinancialTransaction(
    //   financialAction: FinancialAction.expense,
    //   category: FinancialCategory(
    //       'Somne New', Colors.black, SvgPicture.asset(IconsApp.addPlusCircle)),
    //   amount: 35,
    //   date: DateTime.now(),
    // ),
    // FinancialTransaction(
    //   financialAction: FinancialAction.expense,
    //   category: FinancialCategory(
    //       'Somne New', Colors.black, SvgPicture.asset(IconsApp.addPlusCircle)),
    //   amount: 35,
    //   date: DateTime.now(),
    // ),
    // FinancialTransaction(
    //   financialAction: FinancialAction.expense,
    //   category: FinancialCategory(
    //       'Somne New', Colors.black, SvgPicture.asset(IconsApp.addPlusCircle)),
    //   amount: 35,
    //   date: DateTime.now(),
    // ),
  ];
  CategoryService categoryService = CategoryService();
}
