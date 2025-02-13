// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinancialTransactionImpl _$$FinancialTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$FinancialTransactionImpl(
      id: (json['id'] as num?)?.toInt(),
      financialAction:
          $enumDecode(_$FinancialActionEnumMap, json['financialAction']),
      category:
          FinancialCategory.fromJson(json['category'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String?,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$FinancialTransactionImplToJson(
        _$FinancialTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'financialAction': _$FinancialActionEnumMap[instance.financialAction]!,
      'category': instance.category,
      'amount': instance.amount,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
    };

const _$FinancialActionEnumMap = {
  FinancialAction.income: 'income',
  FinancialAction.expense: 'expense',
};
