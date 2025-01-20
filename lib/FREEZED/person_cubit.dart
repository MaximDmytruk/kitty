import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/FREEZED/persone.dart';
import 'package:kitty/model/financial_transaction.dart';

class PersonCubit extends Cubit<Person?> {
  PersonCubit() : super(null);

  void registerUser(
    String password,
    String email,
    String name,
  ) {
    emit(Person(
      email: email,
      name: name,
      amount: '105',
    ));
  }

  void someChange (){

    emit(state!.copyWith(email: 'asdasd'));
  }

  void addFinancialTransaction(FinancialTransaction finTransaction) {
    //TODO:
    // emit(state.listFinTransaction.)
  }
}
