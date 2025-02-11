import 'package:kitty/data/models/financial_category/financial_category.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_transaction.freezed.dart';
part 'financial_transaction.g.dart';

enum FinancialAction {
  income,
  expense,
}

@freezed
class FinancialTransaction with _$FinancialTransaction {
  const factory FinancialTransaction({
    int? id,
    required FinancialAction financialAction,
    required FinancialCategory category,
    required int amount,
    String? description,
    required DateTime date,
  }) = _FinancialTransaction;

  factory FinancialTransaction.fromJson(Map<String, dynamic> json) =>
      _$FinancialTransactionFromJson(json);
}
