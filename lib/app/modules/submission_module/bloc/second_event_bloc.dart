import 'package:equatable/equatable.dart';

abstract class SecondEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SecondFetchListEvent extends SecondEvent {}

class SecondEmptyItemEvent extends SecondEvent {}

class SecondAddItemEvent extends SecondEvent {
  final String item;
  SecondAddItemEvent({required this.item});

  @override
  List<Object?> get props => [item];
}

class SecondRemoveItemEvent extends SecondEvent {
  final String? itemRemove;
  SecondRemoveItemEvent({this.itemRemove});

  @override
  List<Object?> get props => [itemRemove];
}
