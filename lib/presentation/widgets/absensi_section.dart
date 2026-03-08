import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/absen.dart';

class AbsensiSection extends StatelessWidget {
  final List<AbsenModels> absenData;

  const AbsensiSection({super.key, required this.absenData});

  @override
  Widget build(BuildContext context) {
    // Filter data kosong
    final filteredData = absenData.where((e) {
      return e.nama.trim().isNotEmpty;
    }).toList();

    if (filteredData.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: Text("Belum ada data absensi")),
        ),
      );
    }

    return SizedBox(
      height: 320, // tinggi card tetap
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                Configs.absensi,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const Divider(thickness: 1, color: Colors.black12),

              const SizedBox(height: 8),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    final item = filteredData[index];

                    return ListTile(
                      leading: Icon(
                        Icons.person,
                        color: item.kehadiran == 'Y'
                            ? Colors.green
                            : Colors.red,
                      ),

                      title: Text(item.nama.isNotEmpty ? item.nama : "-"),

                      subtitle: Text(
                        item.waktu != null
                            ? formatFullDateWithTime(item.waktu)
                            : "-",
                        style: const TextStyle(color: Colors.grey),
                      ),

                      trailing: Chip(
                        label: Text(
                          item.kehadiran == 'Y' ? "Hadir" : "Tidak Hadir",
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: item.kehadiran == "Y"
                            ? Colors.green
                            : Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
