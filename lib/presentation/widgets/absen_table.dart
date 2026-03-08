// import 'package:flutter/material.dart';
// import 'package:itikaf_tracker/common/helper/utils.dart';
// import 'package:itikaf_tracker/data/models/absen.dart';

// class AbsensiSection extends StatelessWidget {
//   final List<AbsenModels> absenData;

//   const AbsensiSection({super.key, required this.absenData});

//   @override
//   Widget build(BuildContext context) {
//     if (absenData.isEmpty) {
//       return const Card(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Center(child: Text("Belum ada data absensi")),
//         ),
//       );
//     }

//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Absensi Peserta",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 12),

//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: absenData.length,
//               itemBuilder: (context, index) {
//                 final item = absenData[index];

//                 return ListTile(
//                   leading: const Icon(Icons.person),

//                   title: Text(item.nama),

//                   //tanggal  gunakan item.tanggal dan bunga
//                   subtitle: Text(
//                     formatFullDateWithTime(item.waktu),
//                     style: const TextStyle(color: Colors.grey),
//                   ),

//                   trailing: Chip(
//                     label: Text(item.kehadiran),
//                     backgroundColor: item.kehadiran.toLowerCase() == "Hadir"
//                         ? Colors.green
//                         : Colors.red,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
