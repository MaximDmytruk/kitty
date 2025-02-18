// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financial_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinancialTransaction _$FinancialTransactionFromJson(Map<String, dynamic> json) {
  return _FinancialTransaction.fromJson(json);
}

/// @nodoc
mixin _$FinancialTransaction {
  int? get id => throw _privateConstructorUsedError;
  FinancialAction get financialAction => throw _privateConstructorUsedError;
  @FinancialCategoryConverter()
  FinancialCategory get category => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this FinancialTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinancialTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialTransactionCopyWith<FinancialTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialTransactionCopyWith<$Res> {
  factory $FinancialTransactionCopyWith(FinancialTransaction value,
          $Res Function(FinancialTransaction) then) =
      _$FinancialTransactionCopyWithImpl<$Res, FinancialTransaction>;
  @useResult
  $Res call(
      {int? id,
      FinancialAction financialAction,
      @FinancialCategoryConverter() FinancialCategory category,
      int amount,
      String? description,
      DateTime date});

  $FinancialCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$FinancialTransactionCopyWithImpl<$Res,
        $Val extends FinancialTransaction>
    implements $FinancialTransactionCopyWith<$Res> {
  _$FinancialTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? financialAction = null,
    Object? category = null,
    Object? amount = null,
    Object? description = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      financialAction: null == financialAction
          ? _value.financialAction
          : financialAction // ignore: cast_nullable_to_non_nullable
              as FinancialAction,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FinancialCategory,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of FinancialTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinancialCategoryCopyWith<$Res> get category {
    return $FinancialCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FinancialTransactionImplCopyWith<$Res>
    implements $FinancialTransactionCopyWith<$Res> {
  factory _$$FinancialTransactionImplCopyWith(_$FinancialTransactionImpl value,
          $Res Function(_$FinancialTransactionImpl) then) =
      __$$FinancialTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      FinancialAction financialAction,
      @FinancialCategoryConverter() FinancialCategory category,
      int amount,
      String? description,
      DateTime date});

  @override
  $FinancialCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$FinancialTransactionImplCopyWithImpl<$Res>
    extends _$FinancialTransactionCopyWithImpl<$Res, _$FinancialTransactionImpl>
    implements _$$FinancialTransactionImplCopyWith<$Res> {
  __$$FinancialTransactionImplCopyWithImpl(_$FinancialTransactionImpl _value,
      $Res Function(_$FinancialTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? financialAction = null,
    Object? category = null,
    Object? amount = null,
    Object? description = freezed,
    Object? date = null,
  }) {
    return _then(_$FinancialTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      financialAction: null == financialAction
          ? _value.financialAction
          : financialAction // ignore: cast_nullable_to_non_nullable
              as FinancialAction,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FinancialCategory,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialTransactionImpl implements _FinancialTransaction {
  const _$FinancialTransactionImpl(
      {this.id,
      required this.financialAction,
      @FinancialCategoryConverter() required this.category,
      required this.amount,
      this.description,
      required this.date});

  factory _$FinancialTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialTransactionImplFromJson(json);

  @override
  final int? id;
  @override
  final FinancialAction financialAction;
  @override
  @FinancialCategoryConverter()
  final FinancialCategory category;
  @override
  final int amount;
  @override
  final String? description;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'FinancialTransaction(id: $id, financialAction: $financialAction, category: $category, amount: $amount, description: $description, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.financialAction, financialAction) ||
                other.financialAction == financialAction) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, financialAction, category, amount, description, date);

  /// Create a copy of FinancialTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialTransactionImplCopyWith<_$FinancialTransactionImpl>
      get copyWith =>
          __$$FinancialTransactionImplCopyWithImpl<_$FinancialTransactionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialTransactionImplToJson(
      this,
    );
  }
}

abstract class _FinancialTransaction implements FinancialTransaction {
  const factory _FinancialTransaction(
      {final int? id,
      required final FinancialAction financialAction,
      @FinancialCategoryConverter() required final FinancialCategory category,
      required final int amount,
      final String? description,
      required final DateTime date}) = _$FinancialTransactionImpl;

  factory _FinancialTransaction.fromJson(Map<String, dynamic> json) =
      _$FinancialTransactionImpl.fromJson;

  @override
  int? get id;
  @override
  FinancialAction get financialAction;
  @override
  @FinancialCategoryConverter()
  FinancialCategory get category;
  @override
  int get amount;
  @override
  String? get description;
  @override
  DateTime get date;

  /// Create a copy of FinancialTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialTransactionImplCopyWith<_$FinancialTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
