import 'dart:async';

import 'package:aprendendo_modular/app/modules/submission_module/bloc/second_event_bloc.dart';
import 'package:aprendendo_modular/app/modules/submission_module/bloc/second_state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  SecondBloc() : super(SecondLoadingState());

  @override
  Stream<SecondState> mapEventToState(SecondEvent event) async* {
    // if (event is SecondFetchListEvent) {
    //   await _fetchList();
    // } else if (event is SecondEmptyItemEvent) {
    //   await _fetchListWithEmptyList();
    // }
    switch (event.runtimeType) {
      case SecondFetchListEvent:
        yield await _fetchList();
        break;
      case SecondAddItemEvent:
        yield await _addItem(event as SecondAddItemEvent);
        break;
      case SecondRemoveItemEvent:
        yield await _removeItem(event as SecondRemoveItemEvent);
        break;
      default:
    }
  }

  Future<SecondState> _fetchList() async {
    List<String> item = await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => <String>[
        'Item 1',
      ],
    );
    return SecondSucessState(list: item);
  }

  Future<SecondState> _addItem(SecondAddItemEvent event) async {
    if (state is SecondSucessState) {
      final previousList = (state as SecondSucessState).list;
      final newList = List<String>.from(previousList);
      newList.add(event.item);
      return SecondSucessState(list: newList);
    } else if (state is SecondEmptyListState) {
      return SecondSucessState(list: [event.item]);
    }
    return state;
  }

  Future<SecondState> _removeItem(SecondRemoveItemEvent removeEvent) async {
    final isSucess = state is SecondSucessState;
    if (isSucess) {
      final previousRemoveList = (state as SecondSucessState).list;
      final newRemoveItemList = List<String>.from(previousRemoveList);
      newRemoveItemList.remove(removeEvent.itemRemove);
      if (newRemoveItemList.isEmpty) {
        return SecondEmptyListState();
      }
      return SecondSucessState(list: newRemoveItemList);
    }
    return state;
  }
}
