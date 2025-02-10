import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_category.freezed.dart';
part 'financial_category.g.dart';

@freezed
class FinancialCategory with _$FinancialCategory {
  const factory FinancialCategory({
    int? id,
    required String name,
    @ColorConverter() required Color colorValue,
    required String iconPath,
    int? position,
  }) = _FinancialCategory;

  factory FinancialCategory.fromJson(Map<String, dynamic> json) =>
      _$FinancialCategoryFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}
