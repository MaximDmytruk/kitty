part of 'user_cubit.dart';

enum UserStatus {
  initial,
  authenticated,
  error,
}

@freezed
class UserState with _$UserState {
  // const factory UserState.initial() = _Initial;
  // const factory UserState.authenticated(User user) = _Authenticated;
  // const factory UserState.error(String errorText) = _Error;

  const factory UserState({
    @Default(UserStatus.initial) UserStatus status,
    // required DateTimeRange dateRange,
    User? user,
    String? errorText,
  }) = _UserState;
}
