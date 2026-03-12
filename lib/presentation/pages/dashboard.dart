import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/layouts/responsive.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';
import 'package:itikaf_tracker/core/configs/configs.dart';
import 'package:itikaf_tracker/data/models/absen.dart';
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
  List<AbsenModels> absenData = [];
  Timer? refreshTimer;

  String token = '';
  bool showKhutbah = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }

  //init async
  Future<void> init() async {
    await login();
    await fetchData();
    startAutoRefresh();
  }

  void startAutoRefresh() {
    refreshTimer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      await fetchData();
      print("Auto refresh data...");
      setState(() {
        // Update UI after fetching new data
        SnackBar(content: Text("Data refreshed at ${DateTime.now()}"));
      });
    });
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
      final dataAbsen = await service.fetchAbsenData();

      setState(() {
        itikafData = data;
        absenData = dataAbsen;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    final totalPeserta = itikafData.length;

    final totalHadir = absenData.where((e) => e.kehadiran == "Y").length;

    final totalTidakHadir = absenData.where((e) => e.kehadiran != "Y").length;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background-image.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          SingleChildScrollView(
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
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
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
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9),
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
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                        const _ClockWidget(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // const Spacer(),
                      IconButton(
                        tooltip: showKhutbah ? "Hide Khutbah" : "Show Khutbah",
                        icon: Icon(
                          showKhutbah ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            showKhutbah = !showKhutbah;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// KHUTBAH CONTAINER
                  if (showKhutbah)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Khutbahtul Hajjah",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),

                              const Text(
                                Configs.khutbahtulHajah,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                Configs.khubahtulHajjahDescription.join("\n"),
                                style: const TextStyle(color: Colors.white),
                              ),

                              const SizedBox(height: 20),

                              const Text(
                                "Doa Malam Lailatul Qadar",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 20),

                              Text(
                                Configs.doaMalamLailatulQadar,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                Configs.deskripsiDoaMalamLailatulQadar,
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),

                  /// SUMMARY CARDS
                  Responsive(
                    /// MOBILE
                    mobile: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SummaryCard(
                          title: Configs.totalPeserta,
                          value: totalPeserta.toString(),
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 12),
                        SummaryCard(
                          title: Configs.totalHadir,
                          value: totalHadir.toString(),
                          color: Colors.green,
                        ),
                        const SizedBox(height: 12),
                        SummaryCard(
                          title: Configs.totalTidakHadir,
                          value: totalTidakHadir.toString(),
                          color: Colors.red,
                        ),
                      ],
                    ),

                    /// TABLET
                    tablet: Row(
                      children: [
                        Expanded(
                          child: SummaryCard(
                            title: Configs.totalPeserta,
                            value: totalPeserta.toString(),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: SummaryCard(
                            title: Configs.totalHadir,
                            value: totalHadir.toString(),
                            color: Colors.greenAccent,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: SummaryCard(
                            title: Configs.totalTidakHadir,
                            value: totalTidakHadir.toString(),
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),

                    /// DESKTOP
                    desktop: Row(
                      children: [
                        Expanded(
                          child: SummaryCard(
                            title: Configs.totalPeserta,
                            value: totalPeserta.toString(),
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SummaryCard(
                            title: Configs.totalHadir,
                            value: totalHadir.toString(),
                            color: Colors.greenAccent,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: SummaryCard(
                            title: Configs.totalTidakHadir,
                            value: totalTidakHadir.toString(),
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
                      children: [
                        ChartSection(itikafData: itikafData),
                        SizedBox(height: 20),
                        AbsensiSection(absenData: absenData),
                      ],
                    ),

                    tablet: Column(
                      children: [
                        ChartSection(itikafData: itikafData),
                        SizedBox(height: 20),
                        AbsensiSection(absenData: absenData),
                      ],
                    ),

                    desktop: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ChartSection(itikafData: itikafData),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: AbsensiSection(absenData: absenData),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// LAST TEN NIGHTS
                  Text(
                    "${Configs.lastTenNights} ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //tanggal bulan tahun nya itu diambil dari kalender 2026, jadi 10 malam terakhir itu mulai dari tanggal 20 Maret 2026 sampai 29 Maret 2026 otomatis
                  LastTenNightsTimeline(
                    start: DateTime(2026, 3, 1),
                    year: Configs.currentYear,
                  ),

                  const SizedBox(height: 30),

                  Text(
                    Configs.peserta,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    ),
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
        ],
      ),
    );
  }
}

class _ClockWidget extends StatelessWidget {
  const _ClockWidget();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(
        const Duration(seconds: 1),
        (_) => DateTime.now(),
      ),
      initialData: DateTime.now(),
      builder: (context, snapshot) {
        final now = snapshot.data!;

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
            "${daysOfWeek[now.weekday % 7]}, "
            "${now.day} ${getMonthAbbreviation(now.month)} ${now.year} "
            "${now.hour.toString().padLeft(2, '0')}:"
            "${now.minute.toString().padLeft(2, '0')}:"
            "${now.second.toString().padLeft(2, '0')} WIB";

        return Text(
          formattedDate,
          style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 14 : 18,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
