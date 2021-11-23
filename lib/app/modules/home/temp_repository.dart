// import 'package:aprendendo_modular/app/api/datasource.dart';
// import 'package:dio/dio.dart';
// import '../../api/temp_model.dart';

// abstract class TempRepository {
//   Future<TempModel> getTemp();
// }

// class TempRepositoryImplements implements TempRepository {
//   final Dio dio;

//   TempRepositoryImplements(this.dio);

//   @override
//   Future<TempModel> getTemp() async {
//     final response = DatasourceApi().fetchApi();
//     // final response = await dio.get(
//     //     'https://gist.githubusercontent.com/fabricio-godoi/7ff5a083327ea6299554806d0d227f80/raw/09c4bd6b3bb17e79e1171a41b15ca81c6347964d/wheater.json');
//     // if (response.statusCode == 200 &&
//     //     response.data != null &&
//     //     response.data.isNotEmpty) {
//     //   final result = TempModel.fromMap(response.data);
//     //   print(response.data);
//     //   print(result.weekDay);
//     //   return result;
//     // } else {
//     //   throw const FormatException("Erro ao buscar dados");
//     // }
//   }
// }
