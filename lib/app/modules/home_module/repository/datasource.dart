import 'dart:convert';
import 'package:aprendendo_modular/app/modules/home_module/repository/temp_model.dart';
import 'package:dio/dio.dart';

class DatasourceApi {
  Future<TempModel> fetchApi() async {
    final Dio dio = Dio();
    final response = await dio.get(
        'https://gist.githubusercontent.com/fabricio-godoi/7ff5a083327ea6299554806d0d227f80/raw/09c4bd6b3bb17e79e1171a41b15ca81c6347964d/wheater.json');
    if (response.statusCode == 200 &&
        response.data != null &&
        response.data.isNotEmpty) {
      // print(response.data);
      final result = TempModel.fromMap(json.decode(response.data));
      return result;
    } else {
      throw const FormatException("Erro ao buscar dados");
    }
  }
}
