import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardEntityWidget extends StatelessWidget {
  final String heading;
  final String value;
  final bool? isBackground;
  final Color? valueColor;
  const CardEntityWidget({
    Key? key,
    required this.heading,
    required this.value,
    this.isBackground = false,
    this.valueColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: (Get.width / 3) - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: isBackground ?? false,
            replacement: Text(
              value,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: valueColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300),
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: valueColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
