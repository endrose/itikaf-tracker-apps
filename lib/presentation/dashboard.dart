import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/data/source/remote/backend/remote_backend_services.dart';
import 'package:itikaf_tracker/presentation/widgets/absen_table.dart';
import 'package:itikaf_tracker/presentation/widgets/last_ten_nights_timeline.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_chart.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_table.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final RemoteBackendServicesImpl service = RemoteBackendServicesImpl();

  List<ItikafModels> itikafData = [];

  String token = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  //init async
  Future<void> init() async {
    await login();
    await fetchData();
  }

  //login
  Future<void> login() async {
    try {
      final token = await service.authenticate(
        'admin',
        '123',
      ); // Ganti dengan kredensial yang valid

      this.token = token;
      print("Token: $token");
    } catch (e) {
      print("Error during authentication: $e");
    }
  }

  //ambil data peserta itikaf dari api fetchItikafData

  Future<void> fetchData() async {
    try {
      final data = await service.fetchItikafData();

      setState(() {
        itikafData = data;
      });
    } catch (e) {
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
              Row(
                children: [
                  Text(
                    "${Configs.appName} Dashboard $year",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  //Tanggal dan Waktu Jam sekarang real time dengan detiknya juga
                  StreamBuilder<DateTime>(
                    stream: Stream.periodic(const Duration(seconds: 1), (_) {
                      return DateTime.now();
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final now = snapshot.data!;
                        //format nya seperti ini 9 Mar 20226 09:30:45 WIB
                        final formattedDate =
                            "${now.day} ${getMonthAbbreviation(now.month)} ${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')} WIB";

                        return Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  //
                ],
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
                      title: Configs.totalHadir,
                      value: "60",
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _SummaryCard(
                      title: Configs.totalTidakHadir,
                      value: "25",
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// CHART
              /// CHART + ABSENSI
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// CHART ASAL PESERTA
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 260,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            Configs.asal,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(child: PesertaChart()),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  /// ABSENSI PESERTA
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 260,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            Configs.absensi,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: SingleChildScrollView(child: AbsensiTable()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// LAST TEN NIGHTS
              Text(
                "${Configs.lastTenNights} ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              //tanggal bulan tahun nya itu diambil dari kalender 2026, jadi 10 malam terakhir itu mulai dari tanggal 20 Maret 2026 sampai 29 Maret 2026 otomatis
              LastTenNightsTimeline(
                start: DateTime(2026, 3, 1),
                year: Configs.currentYear,
              ),

              const SizedBox(height: 30),

              const Text(
                Configs.peserta,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              /// TABLE
              /// filter nya
              /// search nya
              PesertaTable(itikafData: itikafData),
              //
              const SizedBox(height: 80),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12)),
                ),
                child: Column(
                  children: [
                    Text(
                      "© ${DateTime.now().year} ${Configs.appName}",
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    //icon love
                    const Text(
                      Configs.footerName,
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
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
