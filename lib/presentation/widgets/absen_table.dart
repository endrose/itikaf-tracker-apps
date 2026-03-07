import 'package:flutter/material.dart';

class AbsensiTable extends StatelessWidget {
  const AbsensiTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Nama")),
        DataColumn(label: Text("Kehadiran")),
        DataColumn(label: Text("Tanggal Waktu")),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text("Endros")),
            DataCell(Text("Hadir")),
            DataCell(Text("19 Mar 2026 23:45 WIB")),
          ],
        ),

        DataRow(
          cells: [
            DataCell(Text("Ahmad")),
            DataCell(Text("Hadir")),
            DataCell(Text("19 Mar 2026 19:45 WIB")),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Rizki")),
            DataCell(Text("Hadir")),
            DataCell(Text("19 Mar 2026 20:10 WIB")),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("Fahmi")),
            DataCell(Text("Terlambat")),
            DataCell(Text("19 Mar 2026 20:30 WIB")),
          ],
        ),
      ],
    );
  }
}
