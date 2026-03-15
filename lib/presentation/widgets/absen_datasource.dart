import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/absen.dart';

class AbsenDatasource extends DataTableSource {
  final List<AbsenModels> data;
  final Function(AbsenModels)? onEdit;
  final Function(int)? onDelete;

  AbsenDatasource({required this.data, this.onEdit, this.onDelete});

  @override
  DataRow getRow(int index) {
    final e = data[index];

    return DataRow(
      cells: [
        DataCell(Text(e.nama)),
        DataCell(Text(e.kehadiran)),
        DataCell(Text(e.waktu.toIso8601String())),
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
