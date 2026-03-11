import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';

class PesertaChart extends StatelessWidget {
  final List<ItikafModels> itikafData;

  const PesertaChart({super.key, required this.itikafData});

  @override
  Widget build(BuildContext context) {
    // hitung jumlah peserta berdasarkan asal
    final Map<String, int> asalCount = {};
    //random color

    for (var item in itikafData) {
      final asal = item.asal ?? "Unknown";

      if (asalCount.containsKey(asal)) {
        asalCount[asal] = asalCount[asal]! + 1;
      } else {
        asalCount[asal] = 1;
      }
    }

    final cities = asalCount.keys.toList();
    final counts = asalCount.values.toList();

    Color randomColor(int index) {
      final random = Random(index);
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          show: false,
          border: const Border(top: BorderSide(color: Colors.white, width: 1)),
        ),
        alignment: BarChartAlignment.spaceAround,

        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          checkToShowHorizontalLine: (value) => false,
        ),

        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: const TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ),

          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < cities.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      cities[value.toInt()],
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  );
                }

                return const Text("");
              },
            ),
          ),
        ),

        barGroups: List.generate(
          counts.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: counts[index].toDouble(),
                width: 18,
                color: randomColor(index),
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
