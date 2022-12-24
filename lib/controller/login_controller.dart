import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString flag = '🇮🇳'.obs;
  RxString countryPincode = '+ 91'.obs;
  RxInt phoneCodeLength = 10.obs;

  TextEditingController phoneController = TextEditingController();

  void changeCountry(String countryFlag, String pincode, int phoneLength) {
    flag.value = countryFlag;
    countryPincode.value = pincode;
    phoneCodeLength.value = phoneLength;
  }
}
