import 'package:finowise/controller/dashboard_controller.dart';
import 'package:finowise/view/DashboardView.dart';
import 'package:finowise/view/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
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
      home: DashBoardView(),
    );
  }
}
