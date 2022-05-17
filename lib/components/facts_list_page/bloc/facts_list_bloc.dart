import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'facts_list_event.dart';
part 'facts_list_state.dart';

class FactsListBloc extends Bloc<FactsListEvent, FactsListState> {
  Box? factsBox;
  FactsListBloc() : super(FactsListInitial()) {
    on<LoadFactsEvent>((event, emit) async {
      factsBox = await Hive.openBox('facts_box');
      emit(FactsListInitialized());
    });
  }
}
