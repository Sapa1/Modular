import 'package:aprendendo_modular/app/api/temp_model.dart';
import 'package:equatable/equatable.dart';

abstract class TempState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TempStateSuccess extends TempState {
  final TempModel temperatura;
  TempStateSuccess({required this.temperatura});

  @override
  List<Object?> get props => [temperatura];
}

class TempStateFailure extends TempState {
  final String message;
  TempStateFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class TempStateLoading extends TempState {
  @override
  List<Object?> get props => [];
}

class TempStateEmpty extends TempState {
  @override
  List<Object?> get props => [];
}
