import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_table.dart';

class ItikafPage extends StatefulWidget {
  const ItikafPage({super.key});

  @override
  State<ItikafPage> createState() => _ItikafPageState();
}

class _ItikafPageState extends State<ItikafPage> {
  List<ItikafModels> itikafData = [];
  List<ItikafModels> filteredData = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    final data = [
      ItikafModels(
        id: 1,
        nama: "Ahmad",
        telepon: "08123456789",
        alamat: "Jakarta",
        tanggalLahir: DateTime(1990, 1, 1),
        asal: "DKI",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
        user: "admin",
      ),
      ItikafModels(
        id: 2,
        nama: "Budi",
        telepon: "08123456780",
        alamat: "Bandung",
        tanggalLahir: DateTime(1995, 5, 10),
        asal: "Jabar",
        awal: DateTime.now(),
        akhir: DateTime.now(),
        deskripsi: "Peserta",
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
          e.telepon.contains(keyword) ||
          e.asal.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    setState(() {
      filteredData = result;
    });
  }

  /// BUTTON ADD ACTION
  void addPeserta(String nama, String telepon, String asal) {
    final newData = ItikafModels(
      id: DateTime.now().millisecondsSinceEpoch,
      nama: nama,
      telepon: telepon,
      alamat: "",
      tanggalLahir: DateTime.now(),
      asal: asal,
      awal: DateTime.now(),
      akhir: DateTime.now(),
      deskripsi: "",
      user: "admin",
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
        itikafData[index] = ItikafModels(
          id: id,
          nama: nama,
          telepon: telepon,
          alamat: "",
          tanggalLahir: DateTime.now(),
          asal: asal,
          awal: DateTime.now(),
          akhir: DateTime.now(),
          deskripsi: "",
          user: "admin",
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

  void showPesertaDialog({ItikafModels? peserta}) {
    final namaController = TextEditingController(text: peserta?.nama ?? "");
    final teleponController = TextEditingController(
      text: peserta?.telepon ?? "",
    );
    final asalController = TextEditingController(text: peserta?.asal ?? "");

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(peserta == null ? "Tambah Peserta" : "Edit Peserta"),
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
                  controller: teleponController,
                  decoration: const InputDecoration(labelText: "Telepon"),
                ),
                TextField(
                  controller: asalController,
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
                    teleponController.text,
                    asalController.text,
                  );
                } else {
                  editPeserta(
                    peserta.id,
                    namaController.text,
                    teleponController.text,
                    asalController.text,
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
          "Data Peserta Itikaf",
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
              label: const Text("Tambah Peserta"),
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
          child: PesertaTable(
            itikafData: filteredData,
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
