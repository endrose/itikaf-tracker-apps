import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PesertaChart extends StatelessWidget {
  const PesertaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text("Jakarta");
                  case 1:
                    return const Text("Bekasi");
                  case 2:
                    return const Text("Bogor");
                  case 3:
                    return const Text("Bandung");
                }
                return const Text("");
              },
            ),
          ),
        ),
        barGroups: [
          BarChartGroupData(
            x: 40,
            barRods: [BarChartRodData(toY: 40, color: Colors.blue)],
          ),
          BarChartGroupData(
            x: 20,
            barRods: [BarChartRodData(toY: 20, color: Colors.green)],
          ),
          BarChartGroupData(
            x: 10,
            barRods: [BarChartRodData(toY: 10, color: Colors.orange)],
          ),
          BarChartGroupData(
            x: 15,
            barRods: [BarChartRodData(toY: 15, color: Colors.purple)],
          ),
        ],
      ),
    );
  }
}
