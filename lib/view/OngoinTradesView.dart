import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/trade_card_widget.dart';

class OngoingTradesView extends StatefulWidget {
  const OngoingTradesView({super.key});

  @override
  State<OngoingTradesView> createState() => _OngoingTradesViewState();
}

class _OngoingTradesViewState extends State<OngoingTradesView> {
  final _controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: _controller.isLoading.value
          ? const LoadingIndicator()
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => TradeCardWidget(),
            ),
    );
  }
}
