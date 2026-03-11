import 'package:flutter/material.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_chart.dart';

class ChartSection extends StatelessWidget {
  final List<ItikafModels> itikafData;

  const ChartSection({super.key, required this.itikafData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Configs.asal,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Divider(thickness: 1, color: Colors.white.withOpacity(0.5)),

          const SizedBox(height: 20),
          Expanded(child: PesertaChart(itikafData: itikafData)),
        ],
      ),
    );
  }
}
