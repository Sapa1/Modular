import 'package:aprendendo_modular/app/modules/home_module/bloc/temp_event_bloc.dart';
import 'package:aprendendo_modular/app/modules/home_module/bloc/temp_state_bloc.dart';
import 'package:aprendendo_modular/app/modules/home_module/repository/datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TempHomeBloc extends Bloc<TempEvent, TempState> {
  TempHomeBloc() : super(TempStateLoading());

  @override
  Stream<TempState> mapEventToState(TempEvent event) async* {
    switch (event.runtimeType) {
      case TempFetchApiEvent:
        yield await _fetchApibloc(event);
        break;
    }
  }
  //final resp = await datasourceApi.fetchApi();
// return TempStateSuccess(temperatura: resp);

  Future<TempState> _fetchApibloc(TempEvent event) async {
    // final Dio dio = Dio();
    final DatasourceApi datasourceApi = DatasourceApi();
    try {
      final resp = await datasourceApi.fetchApi();
      return TempStateSuccess(temperatura: resp);
    } catch (e) {
      return TempStateFailure(message: e.toString());
    }
  }

  // Future<TempHomeBloc> _fetchApibloc(TempEvent event) async {
  //   final DatasourceApi datasourceApi = DatasourceApi();
  //   final response = await datasourceApi.fetchApi();
  //   print(response);
  //   TempStateSuccess(temperatura: response);
  //   return state as TempHomeBloc;
  // }


// USAR DEPOIS
  // Future<TempState> _fetchListWithError() async {
  //   return await Future.delayed(
  //     const Duration(
  //       seconds: 3,
  //     ),
  //     () => TempStateFailure(message: 'Erro ao carregar lista'),
  //   );
  // }
}
