import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_state.dart';
part 'date_cubit.freezed.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit()
      : super(DateState(
          selectedYear: DateTime.now().year,
          selectedMonth: DateTime.now().month,
        ));

  void nextYear() {
    if (state.selectedYear == DateTime.now().year) {
      return;
    } else {
      emit(
        state.copyWith(
          selectedYear: state.selectedYear + 1,
          status: DateStatus.loaded,
        ),
      );
    }
  }

  void previousYear() {
    if (state.selectedYear == 1950) {
      return;
    } else {
      emit(
        state.copyWith(
          selectedYear: state.selectedYear - 1,
          status: DateStatus.loaded,
        ),
      );
    }
  }

  int getYear() => state.selectedYear;
  int getMonth() => state.selectedMonth;

  void selectMonth({required int newNumOfMonth}) {
    emit(
      state.copyWith(
        selectedMonth: newNumOfMonth,
        status: DateStatus.loaded,
      ),
    );
  }
}
