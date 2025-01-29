part of 'user_cubit.dart';

enum UserStatus {
  initial,
  authenticated,
  error,
  loading,
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserStatus.initial) UserStatus status,
    User? user,
    String? errorText,
  }) = _UserState;
}
