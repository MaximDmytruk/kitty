import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';




class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  
//TODO:HIVE!! база баних!


}
