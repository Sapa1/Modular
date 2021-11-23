import 'package:aprendendo_modular/app/api/temp_model.dart';
import 'package:aprendendo_modular/app/bloc/temp_event_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aprendendo_modular/app/api/datasource.dart';
import 'package:aprendendo_modular/app/bloc/temp_state_bloc.dart';

class TempHomeBloc extends Bloc<TempEvent, TempState> {
  TempHomeBloc() : super(TempStateLoading());

  @override
  Stream<TempState> mapEventToState(TempEvent event) async* {
    switch (event.runtimeType) {
      case TempFetchApiEvent:
        yield await _fetchApibloc();
        break;
      case TempFetchApiWithErrorEvent:
        yield await _fetchListWithError();
        break;
      case TempFetchApiWithEmptyApiEvent:
        yield await _fetchListWithError();
        break;
    }
  }

  Future<TempState> _fetchApibloc() async {
    // final Dio dio = Dio();
    // final DatasourceApi datasourceApi = DatasourceApi();
    // final response = await dio.get(datasourceApi.fetchApi().toString());
    return TempStateSuccess(
      temperatura: TempModel(
        date: DateTime.now(),
        temp: 40,
        city: "Salvador",
        // date: response.data['results']['date'],
        // temp: response.data['results']['temp'],
        // city: response.data['results']['city'],
      ),
    );
  }

  // Future<TempHomeBloc> _fetchApibloc(TempEvent event) async {
  //   final DatasourceApi datasourceApi = DatasourceApi();
  //   final response = await datasourceApi.fetchApi();
  //   print(response);
  //   TempStateSuccess(temperatura: response);
  //   return state as TempHomeBloc;
  // }

  Future<TempState> _fetchListWithError() async {
    return await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => TempStateFailure(message: 'Erro ao carregar lista'),
    );
  }
}
