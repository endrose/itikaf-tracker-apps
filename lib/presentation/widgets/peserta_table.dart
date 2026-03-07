import 'package:flutter/material.dart';
import 'package:itikaf_tracker/common/helper/utils.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';

class PesertaTable extends StatelessWidget {
  final List<ItikafModels> itikafData;
  const PesertaTable({super.key, required this.itikafData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      //filter nya
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
                    DataCell(Text(formatFullDate(e.tanggalLahir))),
                    DataCell(Text(e.asal)),
                    DataCell(Text(formatShortDate(e.awal))),
                    DataCell(Text(formatShortDate(e.akhir))),
                    DataCell(Text(e.deskripsi)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
