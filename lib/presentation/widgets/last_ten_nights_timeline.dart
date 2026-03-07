import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';

class LastTenNightsTimeline extends StatelessWidget {
  final int year;

  const LastTenNightsTimeline({super.key, required this.year, required DateTime start});

  @override
  Widget build(BuildContext context) {
    final start = DateTime(year, 3, 1);

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 31,
        itemBuilder: (context, index) {
          final date = start.add(Duration(days: index));

          final isLastTen = date.day >= 20 && date.day <= 29;
          final isOddNight = date.day % 2 == 1;

          Color bgColor = Colors.grey.shade200;

          if (isLastTen) {
            bgColor = isOddNight ? Colors.orange : Colors.blue.shade200;
          }

          return Container(
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.day.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  getMonthAbbreviation(date.month),
                  style: const TextStyle(fontSize: 12),
                ),

                if (isLastTen && isOddNight)
                  const Text(
                    "Ganjil",
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),

                if (isLastTen && !isOddNight)
                  const Text(
                    "Genap",
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
