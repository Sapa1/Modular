import 'package:equatable/equatable.dart';

abstract class TempEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TempFetchApiEvent extends TempEvent {}

class TempFetchApiWithErrorEvent extends TempEvent {}

class TempFetchApiWithEmptyApiEvent extends TempEvent {}
