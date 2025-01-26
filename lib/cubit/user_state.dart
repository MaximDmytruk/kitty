part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.authenticated(User user) = _Authenticated;
  const factory UserState.error(String errorText) = _Error;

}

