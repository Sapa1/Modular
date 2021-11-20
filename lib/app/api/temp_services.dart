import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api.dart';

class TempServices {
  static Future<TempDetail> getTemp(String date) async {
    Uri url = Uri.https("api.hgbrasil.com", "/weather?woeid=455827/json");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      TempDetail result = TempDetail.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw const FormatException("Erro ao buscar dados");
    }
  }
}
