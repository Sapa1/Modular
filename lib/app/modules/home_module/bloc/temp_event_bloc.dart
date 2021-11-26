import 'package:equatable/equatable.dart';

abstract class TempEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TempFetchApiEvent extends TempEvent {}
