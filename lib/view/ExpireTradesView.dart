import 'package:finowise/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/loading_indicator.dart';
import '../widgets/trade_card_widget.dart';

class ExpiredTradesView extends StatefulWidget {
  const ExpiredTradesView({super.key});

  @override
  State<ExpiredTradesView> createState() => _ExpiredTradesViewState();
}

class _ExpiredTradesViewState extends State<ExpiredTradesView> {
  final _controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return _controller.isLoading.value
        ? const LoadingIndicator()
        : Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => TradeCardWidget(),
            ),
          );
  }
}
