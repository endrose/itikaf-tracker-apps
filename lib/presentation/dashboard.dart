import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/layouts/responsive.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/data/source/remote/backend/remote_backend_services.dart';
import 'package:itikaf_tracker/presentation/widgets/absensi_section.dart';
import 'package:itikaf_tracker/presentation/widgets/chart_section.dart';
import 'package:itikaf_tracker/presentation/widgets/footer_dashboard.dart';
import 'package:itikaf_tracker/presentation/widgets/last_ten_nights_timeline.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_table.dart';
import 'package:itikaf_tracker/presentation/widgets/summary_card.dart';

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
        Configs.username,
        Configs.password,
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
              Responsive(
                mobile: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${Configs.appName} Dashboard $year",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),

                    /// CLOCK
                    _ClockWidget(),
                  ],
                ),

                tablet: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${Configs.appName} Dashboard $year",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const _ClockWidget(),
                  ],
                ),

                desktop: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${Configs.appName} Dashboard $year",
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const _ClockWidget(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// SUMMARY CARDS
              Responsive(
                /// MOBILE
                mobile: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SummaryCard(
                      title: Configs.totalPeserta,
                      value: "120",
                      color: Colors.blue,
                    ),
                    SizedBox(height: 12),
                    SummaryCard(
                      title: Configs.totalHadir,
                      value: "60",
                      color: Colors.greenAccent,
                    ),
                    SizedBox(height: 12),
                    SummaryCard(
                      title: Configs.totalTidakHadir,
                      value: "25",
                      color: Colors.redAccent,
                    ),
                  ],
                ),

                /// TABLET
                tablet: Row(
                  children: const [
                    Expanded(
                      child: SummaryCard(
                        title: Configs.totalPeserta,
                        value: "120",
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: SummaryCard(
                        title: Configs.totalHadir,
                        value: "60",
                        color: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: SummaryCard(
                        title: Configs.totalTidakHadir,
                        value: "25",
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),

                /// DESKTOP
                desktop: Row(
                  children: const [
                    Expanded(
                      child: SummaryCard(
                        title: Configs.totalPeserta,
                        value: "120",
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SummaryCard(
                        title: Configs.totalHadir,
                        value: "60",
                        color: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SummaryCard(
                        title: Configs.totalTidakHadir,
                        value: "25",
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// CHART
              /// CHART + ABSENSI
              Responsive(
                mobile: Column(
                  children: const [
                    ChartSection(),
                    SizedBox(height: 20),
                    AbsensiSection(),
                  ],
                ),

                tablet: Column(
                  children: const [
                    ChartSection(),
                    SizedBox(height: 20),
                    AbsensiSection(),
                  ],
                ),

                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(flex: 2, child: ChartSection()),
                    SizedBox(width: 20),
                    Expanded(flex: 1, child: AbsensiSection()),
                  ],
                ),
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
              /// search nya
              PesertaTable(itikafData: itikafData),
              //
              const SizedBox(height: 80),
              FooterDashboard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClockWidget extends StatelessWidget {
  const _ClockWidget();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(const Duration(seconds: 1), (_) {
        return DateTime.now();
      }),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final now = snapshot.data!;

        //nama harinya itu diambil dari kalender 2026, jadi 10 malam terakhir itu mulai dari tanggal 20 Maret 2026 sampai

        const daysOfWeek = [
          "Minggu",
          "Senin",
          "Selasa",
          "Rabu",
          "Kamis",
          "Jumat",
          "Sabtu",
        ];
        final formattedDate =
            "${daysOfWeek[now.weekday % 7]}, ${now.day} ${getMonthAbbreviation(now.month)} ${now.year} "
            "${now.hour}:${now.minute.toString().padLeft(2, '0')}:"
            "${now.second.toString().padLeft(2, '0')} WIB";

        // final formattedDate =
        //     "${now.day} ${getMonthAbbreviation(now.month)} ${now.year} "
        //     "${now.hour}:${now.minute.toString().padLeft(2, '0')}:"
        //     "${now.second.toString().padLeft(2, '0')} WIB";

        return Text(
          formattedDate,
          style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 14 : 18,
            color: Colors.grey[700],
          ),
        );
      },
    );
  }
}
