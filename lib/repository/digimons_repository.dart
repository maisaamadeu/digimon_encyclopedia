import 'package:digimon_encyclopedia/models/digimon_model.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class DigimonsRepository {
  Future<List<DigimonModel>> getDigimonsRepositoryHome() async {
    Response response;
    Dio dio = new Dio();

    response =
        await dio.get<List>("https://digimon-api.vercel.app/api/digimon");

    var listDigimons = (response.data as List).map((e) {
      return DigimonModel.fromJson(e);
    }).toList();

    print(listDigimons[1].name);
    return listDigimons;
  }
}
