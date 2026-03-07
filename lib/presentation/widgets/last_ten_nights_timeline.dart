import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';

class LastTenNightsTimeline extends StatelessWidget {
  final DateTime start;
  final int year;

  const LastTenNightsTimeline({
    super.key,
    required this.start,
    required this.year,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 31,
            itemBuilder: (context, index) {
              final date = start.add(Duration(days: index));

              final isLastTen = date.day >= 10 && date.day <= 19;
              final isOddNight = isLastTen && (date.day % 2 == 1);

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
                  ],
                ),
              );
            },
          ),
        ),

        /// LEGEND
        buildLegend(),
      ],
    );
  }
}

Widget buildLegend() {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendItem(Colors.orange, "Malam Ganjil"),
        const SizedBox(width: 20),
        _legendItem(Colors.blue.shade200, "Malam Genap"),
        const SizedBox(width: 20),
        _legendItem(Colors.grey.shade200, "Hari Biasa"),
      ],
    ),
  );
}

Widget _legendItem(Color color, String text) {
  return Row(
    children: [
      Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black12),
        ),
      ),
      const SizedBox(width: 6),
      Text(text, style: const TextStyle(fontSize: 12)),
    ],
  );
}
