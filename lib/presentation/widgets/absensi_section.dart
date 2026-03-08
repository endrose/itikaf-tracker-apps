import 'package:flutter/material.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/absen.dart';
import 'package:itikaf_tracker/presentation/widgets/absen_table.dart';

class AbsensiSection extends StatelessWidget {
  final List<AbsenModels> absenData;
  const AbsensiSection({super.key, required this.absenData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Configs.absensi,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: AbcssensiTable(
                //
                absenData: absenData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
