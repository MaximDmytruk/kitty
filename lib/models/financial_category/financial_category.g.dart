// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinancialCategoryImpl _$$FinancialCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$FinancialCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      colorValue:
          const ColorConverter().fromJson((json['colorValue'] as num).toInt()),
      iconPath: json['iconPath'] as String,
      position: (json['position'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FinancialCategoryImplToJson(
        _$FinancialCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorValue': const ColorConverter().toJson(instance.colorValue),
      'iconPath': instance.iconPath,
      'position': instance.position,
    };
