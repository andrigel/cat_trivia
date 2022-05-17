part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadFactEvent extends HomeEvent {}

class HiveInitEvent extends HomeEvent {}

class SaveFactsList extends HomeEvent {}
