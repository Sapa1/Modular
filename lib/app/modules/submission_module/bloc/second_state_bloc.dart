import 'package:equatable/equatable.dart';

abstract class SecondState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SecondSucessState extends SecondState {
  final List<String> list;
  SecondSucessState({required this.list});

  @override
  List<Object?> get props => [list];
}

class SecondErrorState extends SecondState {
  @override
  List<Object?> get props => [];
}

class SecondLoadingState extends SecondState {
  @override
  List<Object?> get props => [];
}

class SecondEmptyListState extends SecondState {
  @override
  List<Object?> get props => [];
}
