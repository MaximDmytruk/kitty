
import 'package:flutter_bloc/flutter_bloc.dart';
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

  bool loginUser(String email, String password) {
    if (state == null) return false;
    
    if (state!.email == email && state!.password == password) {
      emit(state);
      return true; 
    }
    return false;
  }

}
