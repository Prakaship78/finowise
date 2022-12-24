import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finowise/preferences/app_preference.dart';
import 'package:finowise/preferences/routes.dart';
import 'package:finowise/utils/alert.dart';
import 'package:http/http.dart' as http;
import 'package:finowise/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/connection.dart';

class LoginController extends GetxController {
  RxString flag = '🇮🇳'.obs;
  RxString countryPincode = '+91'.obs;
  RxInt phoneCodeLength = 10.obs;

  TextEditingController phoneController = TextEditingController();
  final _loginService = LoginService(http.Client());
  final appPreference = Get.find<AppPreference>();

  void changeCountry(String countryFlag, String pincode, int phoneLength) {
    flag.value = countryFlag;
    countryPincode.value = pincode;
    phoneCodeLength.value = phoneLength;
  }

  signUp() async {
    var connectivityResult =
        await Connection.sharedInstance.checkConnectivity();
    try {
      final data =
          await _loginService.login(countryPincode.value, phoneController.text);
      if (data.data != null) {
        appPreference.accessToken = data.data?.token;
        appPreference.isLoggedIn = true;
        Get.offAllNamed(RouteNames.dashboardView);
      }
    } catch (e) {
      if (connectivityResult == ConnectivityResult.none) {
        return Alert.errorWidget("No Internet!");
      }
      Alert.errorWidget(e.toString());
    }
  }
}
