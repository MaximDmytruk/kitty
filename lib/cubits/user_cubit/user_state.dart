part of 'user_cubit.dart';

enum UserStatus {
  initial,
  authenticated,
  error,
  loading,
  showToast,
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserStatus.initial) UserStatus status,
    User? user,
    String? errorText,
    String? toastText,
  }) = _UserState;
}
