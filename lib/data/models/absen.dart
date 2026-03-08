import 'package:itikaf_tracker/domain/entities/absen.dart';

class AbsenModels extends AbsenEntity {
  AbsenModels({
    required super.id,
    required super.user,
    required super.nama,
    required super.kehadiran,
    required super.waktu,
  });

  factory AbsenModels.fromJson(Map<String, dynamic> json) => AbsenModels(
    id: json['id'],
    user: json['user'],
    nama: json['nama'],
    kehadiran: json['kehadiran'],
    waktu: DateTime.parse(json['waktu']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'nama': nama,
    'kehadiran': kehadiran,
    'waktu': waktu.toIso8601String(),
  };
}
