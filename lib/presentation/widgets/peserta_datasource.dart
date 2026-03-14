import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';

class PesertaDataSource extends DataTableSource {
  final List<ItikafModels> data;
  final Function(ItikafModels)? onEdit;
  final Function(int)? onDelete;

  PesertaDataSource({required this.data, this.onEdit, this.onDelete});

  @override
  DataRow getRow(int index) {
    final e = data[index];

    return DataRow(
      cells: [
        DataCell(Text(e.nama)),
        DataCell(Text(e.alamat)),
        DataCell(
          Text(
            "${e.tanggalLahir.day}-${e.tanggalLahir.month}-${e.tanggalLahir.year}",
          ),
        ),
        DataCell(Text(e.asal)),
        DataCell(Text("${e.awal.day}-${e.awal.month}-${e.awal.year}")),
        DataCell(Text("${e.akhir.day}-${e.akhir.month}-${e.akhir.year}")),
        DataCell(Text(e.telepon)),

        DataCell(
          Row(
            children: [
              if (onEdit != null)
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => onEdit!(e),
                ),

              if (onDelete != null)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => onDelete!(e.id),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
