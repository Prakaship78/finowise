import 'package:finowise/controller/dashboard_controller.dart';
import 'package:finowise/preferences/app_preference.dart';
import 'package:finowise/preferences/routes.dart';
import 'package:finowise/view/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AppPreference());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(),
      getPages: Routes.routes,
    );
  }
}
