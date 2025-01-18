import 'package:bloc/bloc.dart';
import 'package:kitty/model/user_model.dart';

class UserCubit extends Cubit<User?> {
  UserCubit() : super(null);

  void registerUser(
    String password,
    String email,
    String name,
  ) {
    emit(User(
      password,
      email: email,
      name: name,
    ));
  }
}
