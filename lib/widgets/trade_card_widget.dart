import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_entity_widget.dart';

class TradeCardWidget extends StatelessWidget {
  const TradeCardWidget({
    Key? key,
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
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Colors.grey.shade400,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "XYZ Trade",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: const [
                    Text(
                      "22-10-2022",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
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
                value: 'Equity',
              ),
              CardEntityWidget(
                heading: 'Type:',
                value: '150',
              ),
              CardEntityWidget(
                heading: 'Type:',
                value: '350',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardEntityWidget(
                heading: 'Step Loss:',
                value: 'Equity',
              ),
              CardEntityWidget(
                heading: 'Stock Name:',
                value: '150',
              ),
              CardEntityWidget(
                heading: 'Action',
                value: '350',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardEntityWidget(
                isBackground: true,
                heading: 'Result:',
                value: 'Equity',
              ),
              CardEntityWidget(
                isBackground: true,
                heading: 'Posted by:',
                value: '150',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
