import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/absen.dart';

class AbsensiTable extends StatelessWidget {
  final List<AbsenModels> absenData;

  const AbsensiTable({super.key, required this.absenData});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Nama")),
        DataColumn(label: Text("Kehadiran")),
        DataColumn(label: Text("Tanggal Waktu")),
      ],

      //ganti dengan itikafData yang diambil dari api
      rows: absenData
          .map(
            (e) => DataRow(
              cells: [
                DataCell(Text(e.nama!)),
                DataCell(Text(e.kehadiran!)),
                DataCell(Text(e.waktu as String)),
              ],
            ),
          )
          .toList(),
    );
  }
}
