import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty/models/user/user.dart';
import 'package:kitty/repositories/user_repository/user_repository.dart';
import 'package:kitty/localization/app_locale.dart';

import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository)
      : super(UserState(status: UserStatus.initial)) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final User? user = await userRepository.getUser();
    if (user == null) {
      emit(
        state.copyWith(status: UserStatus.initial),
      );
    } else {
      emit(
        state.copyWith(status: UserStatus.initial, user: user),
      );
    }
  }

  Future<void> getUser() async {
    emit(state.copyWith(status: UserStatus.loading));

    final user = await userRepository.getUser();

    if (user == null) {
      emit(
        state.copyWith(
            status: UserStatus.error, errorText: "No registered user"),
      );
    } else {
      emit(
        state.copyWith(status: UserStatus.authenticated, user: user),
      );
    }
  }

  Future<void> registerUser(String password, String email, String name) async {
    emit(state.copyWith(status: UserStatus.loading));

    final User? checkingUser = await userRepository.getUser();

    if (checkingUser != null) {
      emit(
        state.copyWith(
          errorText: AppLocale.errorUserRegistered,
          status: UserStatus.error,
        ),
      );
      return;
    }

    final User newUser = User(
      name: name,
      password: password,
      email: email,
    );

    await userRepository.registerUser(user: newUser);

    final User? registeredUser = await userRepository.getUser();

    emit(
      state.copyWith(
        user: registeredUser,
        status: UserStatus.authenticated,
      ),
    );
  }

  Future<void> loginUser(String email, String password) async {
    emit(state.copyWith(status: UserStatus.loading));

    User? registeredUser = await userRepository.getUser();

    if (registeredUser == null) {
      emit(
        state.copyWith(
          errorText: "No user registered",
          status: UserStatus.error,
        ),
      );
      return;
    }

    if (registeredUser.email == email && registeredUser.password == password) {
      emit(
        state.copyWith(
          user: registeredUser,
          status: UserStatus.authenticated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorText: "Invalid email or password",
          status: UserStatus.error,
        ),
      );
    }
  }

  void removeUser() async {
    emit(state.copyWith(status: UserStatus.loading));
    await userRepository.removeUser();
    emit(
      state.copyWith(
        user: null,
        status: UserStatus.initial,
      ),
    );
  }

  String getUserName() => state.user?.name ?? 'No Name';
  String getFirstLetterName() => state.user?.name[0].toUpperCase() ?? '-';
  String getUserEmail() => state.user?.email ?? 'No Email';

  void showToast({required String text}) {
    BotToast.showCustomText(
      align: Alignment.topCenter,
      toastBuilder: (_) {
        return Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            color: ColorsApp.grey66,
            child: Text(
              text,
              style: interTextStyle(
                fontWeight: FontWeight.w500,
                color: ColorsApp.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
