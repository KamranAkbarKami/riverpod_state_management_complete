import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class ApiServices {
  String endPoint = "https://reqres.in/api/users?page=1";

  Future<UserModel> getUser() async {
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

Future<String> fetchFutureWeatherReport() async {
  return await Future.delayed(
    const Duration(
      seconds: 3,
    ),
    () => "33 Degree C",
  );
}

Stream<int> fetchStreamNumber() {
  return Stream<int>.periodic(
    const Duration(
      seconds: 3,
    ),
    (number) => number,
  ).take(100);
}

Future<String> fetchFutureWeatherReportFamily({required String city}) async {
  return await Future.delayed(
    const Duration(
      seconds: 3,
    ),
    () => "City: $city || 33 Degree C",
  );
}
