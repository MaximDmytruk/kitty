import 'package:freezed_annotation/freezed_annotation.dart';

part 'persone.freezed.dart'; 
part 'persone.g.dart'; 

@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required String email,
    required String amount,
    @Default(true) bool someBoolValue,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
