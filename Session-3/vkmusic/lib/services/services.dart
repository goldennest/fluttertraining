import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vkmusic/utils/common_export.dart';

import '../model/xmodel.dart';

class ApiServices {
  static final ApiServices _instance = ApiServices._createinstance();
  factory ApiServices() {
    return _instance;
  }
  ApiServices._createinstance();

  final dio = Dio();

  Future<List<MusicModel>> getSongList() async {
    Response response;
    response = await dio.get(BASEURL);
    print(response.data.toString());
    var out = jsonDecode(response.data);
    return List.from(out["results"]).map(
      (e) => MusicModel.fromMap(e),
    ).toList();

  }
}
