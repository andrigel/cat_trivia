import 'package:bloc/bloc.dart';
import 'package:cat_trivia/helpers/api/api.dart';
import 'package:cat_trivia/helpers/imageLoader.dart';
import 'package:cat_trivia/models/fact/fact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
part 'home_event.dart';
part 'home_state.dart';

final logger = Logger();

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Fact? fact;
  Image? image;
  final RestClient client;
  Box? factsBox;

  bool isFactLoaded = false;
  bool isPhotoLoaded = false;

  HomeBloc({required this.client}) : super(HomeInitial()) {
    on<HiveInitEvent>((event, emit) async {
      factsBox = await Hive.openBox('facts_box');
      add(LoadFactEvent());
    });
    on<LoadFactEvent>((event, emit) async {
      emit(HomeLoading());
      image = await loadNetworkImage();
      bool isError = false;
      fact = (await client.getFact().onError((error, stackTrace) {
        isError = true;
        image = Image.asset('assets/icons/cat.png');
        return Fact(
            text: 'Ops! That seems someth went wrong :(',
            updatedAt: DateTime.now());
      }));
      if (!isError && fact != null) {
        await factsBox!.add(fact);
      }
      emit(HomeInitial());
    });
  }
}
