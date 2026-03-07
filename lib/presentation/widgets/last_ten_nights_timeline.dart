import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';

class LastTenNightsTimeline extends StatelessWidget {
  final DateTime start;

  const LastTenNightsTimeline({super.key, required this.start});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          final date = start.add(Duration(days: index));
          final isOddNight = date.day % 2 == 1;
          final isEvenNight = date.day % 2 == 0;

          return Container(
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: isOddNight ? Colors.orange : Colors.blue.shade100,
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
                //ubah ke Mar
                Text(
                  "${getMonthAbbreviation(date.month)}",
                  style: const TextStyle(fontSize: 12),
                ),
                if (isOddNight)
                  const Text(
                    "GanjiI",
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),

                if (isEvenNight)
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
