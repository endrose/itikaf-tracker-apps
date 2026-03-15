import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/absen.dart';
import 'package:itikaf_tracker/presentation/widgets/absen_datasource.dart';

class AbsenTable extends StatelessWidget {
  final List<AbsenModels> absenData;
  final Function(AbsenModels)? onEdit;
  final Function(int)? onDelete;

  const AbsenTable({
    super.key,
    required this.absenData,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final source = AbsenDatasource(
      data: absenData,
      onEdit: onEdit,
      onDelete: onDelete,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 1200, // kasih width tetap
        child: PaginatedDataTable(
          header: const Text("Daftar Absen Peserta"),
          rowsPerPage: 5,
          columns: const [
            //no suray
            DataColumn(label: Text("Nama")),
            DataColumn(label: Text("Kehadiran")),
            DataColumn(label: Text("Waktu")),
            DataColumn(label: Text("Action")),
          ],
          source: source,
        ),
      ),
    );
  }
}
