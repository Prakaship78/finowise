import 'package:country_picker/country_picker.dart';
import 'package:finowise/utils/alert.dart';
import 'package:finowise/widgets/googleButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:finowise/controller/login_controller.dart';

import '../widgets/signup_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.srgbToLinearGamma()),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: SvgPicture.asset('assets/svg_icons/banner.svg')),
            Obx(() {
              return Expanded(
                  flex: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      _controller.changeCountry(
                                          country.flagEmoji,
                                          "+${country.phoneCode}",
                                          country.example.length);
                                      _controller.phoneController.clear();
                                    },
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    width: 100,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: Colors.grey))),
                                    child: Row(
                                      children: [
                                        Text(
                                          _controller.flag.value,
                                          style: const TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          _controller.countryPincode.value,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 200,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.grey))),
                                  child: TextField(
                                    controller: _controller.phoneController,
                                    maxLength:
                                        _controller.phoneCodeLength.value,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: ''),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SignupButton(
                            onTap: () {
                              if (_controller.phoneController.text.length !=
                                  _controller.phoneCodeLength.value) {
                                Alert.errorWidget(
                                    'Please fill the phone number');
                              } else {
                                _controller.signUp();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text('With'),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const GoogleButton()
                        ],
                      ),
                    ),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
