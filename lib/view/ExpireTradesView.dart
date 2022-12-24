import 'package:finowise/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/loading_indicator.dart';
import '../widgets/trade_card_widget.dart';

class ExpiredTradesView extends StatelessWidget {
  final _controller = Get.find<DashboardController>();

  ExpiredTradesView({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.getExpiredTrades();

    return Obx(() {
      return _controller.expiredLoading.value
          ? const LoadingIndicator()
          : ListView.builder(
              itemCount: _controller.expiredTrades.length,
              itemBuilder: (context, index) {
                final trade = _controller.ongoingTrades[index];
                return TradeCardWidget(
                  cardHeadline: trade.name,
                  action: trade.action,
                  date: trade.postedDate,
                  entry: trade.entryPrice?.toStringAsFixed(2),
                  exit: trade.exitPrice?.toStringAsFixed(2),
                  postedBy: trade.user?.name,
                  status: trade.status,
                  stockName: trade.stock,
                  stopLoss: trade.stopLossPrice?.toStringAsFixed(2),
                  type: trade.type,
                );
              });
    });
  }
}
