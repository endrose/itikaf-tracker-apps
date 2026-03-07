import 'package:flutter/material.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/data/source/remote/backend/remote_backend_services.dart';
import 'package:itikaf_tracker/presentation/widgets/last_ten_nights_timeline.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ItikafModels> itikafData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  //ambil data peserta itikaf dari api fetchItikafData

  Future<void> fetchData() async {
    try {
      final data = await RemoteBackendServicesImpl().fetchItikafData();

      // Handle data as needed
      setState(() {
        itikafData = data;
      });
    } catch (e) {
      // Handle error
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    final List<ItikafModels> itikaf = [];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Configs.appName} Dashboard $year",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// SUMMARY CARDS
              Row(
                children: const [
                  Expanded(
                    child: _SummaryCard(
                      title: Configs.totalPeserta,
                      value: "120",
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _SummaryCard(
                      title: Configs.sedangItikaf,
                      value: "35",
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _SummaryCard(
                      title: Configs.selesai,
                      value: "60",
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _SummaryCard(
                      title: Configs.akanDatang,
                      value: "25",
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// CHART
              Container(
                height: 220,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: const PesertaChart(),
              ),

              const SizedBox(height: 30),

              /// LAST TEN NIGHTS
              const Text(
                "10 Malam Terakhir Ramadhan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              //tanggal bulan tahun nya itu diambil dari kalender 2026, jadi 10 malam terakhir itu mulai dari tanggal 20 Maret 2026 sampai 29 Maret 2026 otomatis
              LastTenNightsTimeline(start: Configs.lastTenNightsStart),

              //LastTenNightsTimeline(start: DateTime(2026, 3, 20)),
              const SizedBox(height: 30),

              const Text(
                Configs.peserta,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              /// TABLE
              Container(
                height: 320,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("Nama")),
                      DataColumn(label: Text("Telepon")),
                      DataColumn(label: Text("Alamat")),
                      DataColumn(label: Text("Tanggal Lahir")),
                      DataColumn(label: Text("Asal")),
                      DataColumn(label: Text("Awal")),
                      DataColumn(label: Text("Akhir")),
                      DataColumn(label: Text("Deskripsi")),
                    ],

                    //ganti dengan itikafData yang diambil dari api
                    rows: itikafData
                        .map(
                          (e) => DataRow(
                            cells: [
                              DataCell(Text(e.nama)),
                              DataCell(Text(e.telepon)),
                              DataCell(Text(e.alamat)),
                              DataCell(Text(e.tanggalLahir as String)),
                              DataCell(Text(e.asal)),
                              DataCell(Text(e.awal as String)),
                              DataCell(Text(e.akhir as String)),
                              DataCell(Text(e.deskripsi)),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
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
