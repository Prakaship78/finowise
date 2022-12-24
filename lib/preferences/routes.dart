import 'package:finowise/view/DashboardView.dart';
import 'package:finowise/view/LoginView.dart';
import 'package:finowise/view/SplashScreen.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RouteNames.splash, page: () => const SplashScreen()),
    GetPage(name: RouteNames.loginView, page: () => LoginView()),
    GetPage(name: RouteNames.dashboardView, page: () => const DashBoardView()),
  ];
}

class RouteNames {
  // for splash screen
  static const splash = '/splash';
  // for login page
  static const loginView = '/login_view';
//for dashboard page
  static const dashboardView = '/dashboard_view';
}
