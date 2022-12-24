import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_entity_widget.dart';

class TradeCardWidget extends StatelessWidget {
  final String? cardHeadline;
  final String? date;
  final String? type;
  final String? entry;
  final String? exit;
  final String? stopLoss;
  final String? stockName;
  final String? action;
  final String? status;
  final String? postedBy;

  const TradeCardWidget({
    Key? key,
    this.cardHeadline,
    this.date,
    this.type,
    this.entry,
    this.exit,
    this.stopLoss,
    this.stockName,
    this.action,
    this.status,
    this.postedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      width: Get.width,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Colors.grey.shade400,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: Get.width / 2),
                  child: Text(
                    cardHeadline ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      date ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white70,
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardEntityWidget(
                heading: 'Type:',
                value: type ?? '',
              ),
              CardEntityWidget(
                heading: 'Entry:',
                value: entry ?? '',
              ),
              CardEntityWidget(
                heading: 'Exit:',
                value: exit ?? '',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardEntityWidget(
                heading: 'Stop Loss:',
                value: stopLoss ?? '',
              ),
              CardEntityWidget(
                heading: 'Stock Name:',
                value: stockName ?? '',
              ),
              CardEntityWidget(
                heading: 'Action',
                value: action ?? '',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardEntityWidget(
                isBackground: true,
                heading: 'Status:',
                value: status ?? '',
              ),
              CardEntityWidget(
                isBackground: true,
                heading: 'Posted by:',
                value: postedBy ?? '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
