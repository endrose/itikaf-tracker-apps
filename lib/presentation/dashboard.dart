import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Itikaf Tracker Dashboard",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// SUMMARY CARDS
            Row(
              children: const [
                Expanded(
                  child: _SummaryCard(
                    title: "Total Peserta",
                    value: "120",
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _SummaryCard(
                    title: "Sedang Itikaf",
                    value: "35",
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _SummaryCard(
                    title: "Selesai",
                    value: "60",
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _SummaryCard(
                    title: "Akan Datang",
                    value: "25",
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// CHART PLACEHOLDER
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
              ),
              child: const Center(
                child: Text(
                  "Chart Statistik Peserta (Dummy)",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Daftar Peserta",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            /// TABLE
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Nama")),
                    DataColumn(label: Text("Asal")),
                    DataColumn(label: Text("Telepon")),
                    DataColumn(label: Text("Mulai")),
                    DataColumn(label: Text("Akhir")),
                    DataColumn(label: Text("Status")),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text("Endros")),
                        DataCell(Text("Jakarta")),
                        DataCell(Text("08123456789")),
                        DataCell(Text("19 Mar 2026")),
                        DataCell(Text("29 Mar 2026")),
                        DataCell(Text("Aktif")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("Ahmad")),
                        DataCell(Text("Bekasi")),
                        DataCell(Text("08123456780")),
                        DataCell(Text("20 Mar 2026")),
                        DataCell(Text("30 Mar 2026")),
                        DataCell(Text("Akan Datang")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("Yusuf")),
                        DataCell(Text("Bogor")),
                        DataCell(Text("08123456781")),
                        DataCell(Text("15 Mar 2026")),
                        DataCell(Text("25 Mar 2026")),
                        DataCell(Text("Selesai")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// SUMMARY CARD
class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
