import 'dart:convert';

import 'package:finowise/model/login_model.dart';
import 'package:finowise/utils/constant.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final http.Client client;
  LoginService(this.client);

  Future<LoginModel> login(String countyCode, String mobileNo) async {
    final data = {
      "country_code": countyCode,
      "mobile": mobileNo,
      "otp": '1234',
      "device_id": "N832948jdshjsi23478923",
      "device_type": "android"
    };

    var response = await client.post(
      Uri.parse(LOGIN_URL),
      body: data,
    );
    if (response.statusCode == 200) {
      final data = LoginModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw "Failed to login!";
    }
  }
}
