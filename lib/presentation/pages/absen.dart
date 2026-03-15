import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/absen.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/presentation/widgets/absen_table.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_table.dart';

class AbsenPage extends StatefulWidget {
  const AbsenPage({super.key});

  @override
  State<AbsenPage> createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> {
  List<AbsenModels> itikafData = [];
  List<AbsenModels> filteredData = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    final data = [
      AbsenModels(
        id: 1,
        nama: "Ahmad",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
      AbsenModels(
        id: 2,
        nama: "Budi",
        kehadiran: "Hadir",
        waktu: DateTime.now(),
        user: "admin",
      ),
    ];

    setState(() {
      itikafData = data;
      filteredData = data;
    });
  }

  void filterData(String keyword) {
    final result = itikafData.where((e) {
      return e.nama.toLowerCase().contains(keyword.toLowerCase()) ||
          e.kehadiran.contains(keyword) ||
          e.waktu.toString().contains(keyword);
    }).toList();

    setState(() {
      filteredData = result;
    });
  }

  /// BUTTON ADD ACTION
  void addPeserta(String nama, String telepon, String asal) {
    final newData = AbsenModels(
      id: DateTime.now().millisecondsSinceEpoch,
      nama: nama,
      user: "admin",
      kehadiran: "Hadir",
      waktu: DateTime.now(),
    );

    setState(() {
      itikafData.add(newData);
      filteredData = itikafData;
    });
  }

  void editPeserta(int id, String nama, String telepon, String asal) {
    final index = itikafData.indexWhere((e) => e.id == id);

    if (index != -1) {
      setState(() {
        itikafData[index] = AbsenModels(
          id: id,
          nama: nama,
          user: "admin",
          kehadiran: "Hadir",
          waktu: DateTime.now(),
        );

        filteredData = itikafData;
      });
    }
  }

  void deletePeserta(int id) {
    setState(() {
      itikafData.removeWhere((e) => e.id == id);
      filteredData = itikafData;
    });
  }

  void showPesertaDialog({AbsenModels? peserta}) {
    final namaController = TextEditingController(text: peserta?.nama ?? "");
    final kehadiranController = TextEditingController(
      text: peserta?.kehadiran ?? "",
    );
    final waktuController = TextEditingController(
      text: peserta!.waktu.toString(),
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(peserta == null ? "Tambah Absen" : "Edit Absen"),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(labelText: "Nama"),
                ),
                TextField(
                  controller: kehadiranController,
                  decoration: const InputDecoration(labelText: "Telepon"),
                ),
                TextField(
                  controller: waktuController,
                  decoration: const InputDecoration(labelText: "Asal"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text("Simpan"),
              onPressed: () {
                if (peserta == null) {
                  addPeserta(
                    namaController.text,
                    kehadiranController.text,
                    waktuController.text,
                  );
                } else {
                  editPeserta(
                    peserta.id,
                    namaController.text,
                    kehadiranController.text,
                    waktuController.text,
                  );
                }

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Data Absen Peserta",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        /// SEARCH + BUTTON
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: searchController,
                onChanged: filterData,
                decoration: InputDecoration(
                  hintText: "Cari peserta...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                showPesertaDialog();
              },
              icon: const Icon(Icons.add),
              label: const Text("Tambah Absen"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Expanded(
          child: AbsenTable(
            absenData: filteredData,
            onEdit: (peserta) {
              showPesertaDialog(peserta: peserta);
            },
            onDelete: (id) {
              deletePeserta(id);
            },
          ),
        ),
      ],
    );
  }
}
