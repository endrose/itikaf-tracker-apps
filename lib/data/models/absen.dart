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
    id: json['Id'] ?? 0,
    user: json['User'] ?? '',
    nama: json['Nama'] ?? '',
    kehadiran: json['Kehadiran'] ?? 'N',
    waktu: DateTime.tryParse(json['Waktu']?.toString() ?? '') ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'nama': nama,
    'kehadiran': kehadiran,
    'waktu': waktu.toIso8601String(),
  };
}
