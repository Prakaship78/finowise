import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finowise/model/trade_model.dart';
import 'package:finowise/preferences/app_preference.dart';
import 'package:finowise/service/trade_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../preferences/routes.dart';
import '../utils/alert.dart';
import '../utils/connection.dart';
import '../view/LoginView.dart';

class DashboardController extends GetxController {
  RxBool ongoingLoading = false.obs;
  RxBool expiredLoading = false.obs;
  final appPrefence = Get.find<AppPreference>();

  final _tradeService = TradeService(http.Client());

  var ongoingTrades = <Trade>[].obs;

  getOngoingTrades() async {
    ongoingLoading.value = true;
    var connectivityResult =
        await Connection.sharedInstance.checkConnectivity();
    try {
      final response = await _tradeService.getTrades(
          'ongoing', appPrefence.accessToken ?? '');
      if (response?.data != null) {
        ongoingTrades.value = response?.data ?? [];
        ongoingLoading.value = false;
      }
    } catch (e) {
      if (connectivityResult == ConnectivityResult.none) {
        expiredLoading.value = false;
        return Alert.errorWidget("No Internet!");
      }
      if (e == ApiError.TokenExpiredException) {
        ongoingLoading.value = false;
        Get.to(LoginView());
        Alert.errorWidget("Please login to continue");
        return;
      }
      ongoingLoading.value = false;
      Alert.errorWidget(e.toString());
    }
  }

  var expiredTrades = <Trade>[].obs;

  getExpiredTrades() async {
    var connectivityResult =
        await Connection.sharedInstance.checkConnectivity();
    expiredLoading.value = true;
    try {
      final response = await _tradeService.getTrades(
          'ongoing', appPrefence.accessToken ?? '');
      if (response?.data != null) {
        expiredTrades.value = response?.data ?? [];
        expiredLoading.value = false;
      }
    } catch (e) {
      if (connectivityResult == ConnectivityResult.none) {
        expiredLoading.value = false;
        return Alert.errorWidget("No Internet!");
      }
      if (e == ApiError.TokenExpiredException) {
        expiredLoading.value = false;
        Get.offAllNamed(RouteNames.loginView);

        Alert.errorWidget("Please login to continue");
        return;
      }
      expiredLoading.value = false;
      Alert.errorWidget(e.toString());
    }
  }
}
