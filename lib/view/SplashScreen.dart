import 'package:finowise/preferences/app_preference.dart';
import 'package:finowise/preferences/routes.dart';
import 'package:finowise/view/DashboardView.dart';
import 'package:finowise/view/LoginView.dart';
import 'package:finowise/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appPreference = Get.find<AppPreference>();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      if (appPreference.isLoggedIn != null &&
          appPreference.isLoggedIn == true) {
        Get.offAllNamed(RouteNames.dashboardView);
      } else {
        Get.offAllNamed(RouteNames.loginView);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingIndicator(),
    );
  }
}
