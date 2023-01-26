import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class API {
  Future<Map> getDefaultAPI({
    int pageSize = 25,
  }) async {
    Uri request = Uri.https(
      'www.digi-api.com',
      '/api/v1/digimon',
      {
        'pageSize': '${pageSize}',
      },
    );

    http.Response response = await http.get(request);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro não foi possível carregar os Digimons');
    }
  }
}
