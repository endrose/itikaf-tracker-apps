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
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),

      //filter nya
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  "#",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Nama",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Telepon",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Alamat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Tanggal Lahir",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Asal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Awal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Akhir",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Deskripsi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            rows: itikafData
                .map(
                  (e) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "${itikafData.indexOf(e) + 1}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(e.nama, style: TextStyle(color: Colors.white)),
                      ),
                      DataCell(
                        Text(e.telepon, style: TextStyle(color: Colors.white)),
                      ),
                      DataCell(
                        Text(e.alamat, style: TextStyle(color: Colors.white)),
                      ),
                      DataCell(
                        Text(
                          formatFullDate(e.tanggalLahir),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(e.asal, style: TextStyle(color: Colors.white)),
                      ),
                      DataCell(
                        Text(
                          formatShortDate(e.awal),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatShortDate(e.akhir),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(
                          e.deskripsi,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
