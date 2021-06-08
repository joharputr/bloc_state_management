import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();
  Future<dynamic> getData() async {
    final url = "https://reqres.in/api/users/2";
    final response = await dio.get(url);
    print("responseDapa = ${response.data}");
    return json.encode(response.data);
  }
}
