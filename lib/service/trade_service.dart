import 'dart:convert';

import 'package:finowise/model/trade_model.dart';
import 'package:finowise/utils/constant.dart';
import 'package:http/http.dart' as http;

enum ApiError { TokenExpiredException }

class TradeService {
  final http.Client client;

  TradeService(
    this.client,
  );

  Future getTrades(String filter, String token) async {
    final data = {"filters": filter};

    var response = await client.post(Uri.parse(TRADE_LIST_URL),
        body: data, headers: {"vAuthorization": "Bearer $token"});
    if (response.statusCode == 200) {
      final data = TradeModel.fromJson(jsonDecode(response.body));

      return data;
    } else if (response.statusCode == 401) {
      throw ApiError.TokenExpiredException;
    } else {
      throw "Failed to get trades!";
    }
  }
}
