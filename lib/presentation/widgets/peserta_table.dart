import 'package:flutter/material.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';
import 'package:itikaf_tracker/presentation/widgets/peserta_datasource.dart';

class PesertaTable extends StatelessWidget {
  final List<ItikafModels> itikafData;
  final Function(ItikafModels)? onEdit;
  final Function(int)? onDelete;

  const PesertaTable({
    super.key,
    required this.itikafData,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final source = PesertaDataSource(
      data: itikafData,
      onEdit: onEdit,
      onDelete: onDelete,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 1200, // kasih width tetap
        child: PaginatedDataTable(
          header: const Text("Daftar Peserta Itikaf"),
          rowsPerPage: 5,
          columns: [
            //no suray
            const DataColumn(label: Text("Nama")),
            const DataColumn(label: Text("Alamat")),
            const DataColumn(label: Text("Tanggal Lahir")),
            const DataColumn(label: Text("Asal")),
            const DataColumn(label: Text("Awal")),
            const DataColumn(label: Text("Akhir")),
            const DataColumn(label: Text("Telepon")),
            const DataColumn(label: Text("Action")),
          ],
          source: source,
        ),
      ),
    );
  }

  
}
