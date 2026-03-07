import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PesertaChart extends StatelessWidget {
  const PesertaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),

        gridData: FlGridData(show: true),

        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 28),
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
                const cities = ["Jakarta", "Bekasi", "Bogor", "Bandung"];

                if (value.toInt() >= 0 && value.toInt() < cities.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      cities[value.toInt()],
                      style: const TextStyle(fontSize: 11),
                    ),
                  );
                }

                return const Text("");
              },
            ),
          ),
        ),

        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [BarChartRodData(toY: 40, width: 18, color: Colors.blue)],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [BarChartRodData(toY: 20, width: 18, color: Colors.green)],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(toY: 10, width: 18, color: Colors.orange),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(toY: 15, width: 18, color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}
