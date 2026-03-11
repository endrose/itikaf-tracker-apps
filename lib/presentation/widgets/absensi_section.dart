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
      return Card(
        color: Colors.white.withOpacity(0.15),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              "Belum ada data absensi",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 320, // tinggi card tetap
      child: Card(
        elevation: 0,
        color: Colors.white.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "${Configs.absensi}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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

                      title: Text(
                        item.nama.isNotEmpty ? item.nama : "-",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

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
