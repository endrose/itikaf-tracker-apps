import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';

class ItikafTimeline extends StatelessWidget {
  final DateTime start;
  final DateTime end;

  const ItikafTimeline({super.key, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    final totalDays = end.difference(start).inDays + 1;

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalDays,
        itemBuilder: (context, index) {
          final date = start.add(Duration(days: index));

          return Container(
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.day.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  getMonthAbbreviation(date.month),
                  style: const TextStyle(fontSize: 12, color: Colors.redAccent),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
