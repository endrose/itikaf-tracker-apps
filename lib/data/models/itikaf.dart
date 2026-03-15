import 'package:itikaf_tracker/domain/entities/itikaf.dart';

class ItikafModels extends ItikafEntity {
  ItikafModels({
    required super.id,
    required super.user,
    required super.nama,
    required super.alamat,
    required super.telepon,
    required super.tanggalLahir,
    required super.asal,
    required super.awal,
    required super.akhir,
    required super.deskripsi,
  });

  factory ItikafModels.fromJson(Map<String, dynamic> json) => ItikafModels(
    id: json['Id'] ?? 0,
    user: json['User'] ?? '',
    nama: json['Nama'] ?? '',
    alamat: json['Alamat'] ?? '',
    telepon: json['Telepon']?.toString() ?? '',
    tanggalLahir:
        DateTime.tryParse(json['Tanggal Lahir']?.toString() ?? '') ??
        DateTime(2000),
    asal: json['Asal'] ?? '',
    awal: DateTime.tryParse(json['Awal']?.toString() ?? '') ?? DateTime.now(),
    akhir: DateTime.tryParse(json['Akhir']?.toString() ?? '') ?? DateTime.now(),
    deskripsi: json['Deskripsi'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'nama': nama,
    'alamat': alamat,
    'telepon': telepon,
    'tanggalLahir': tanggalLahir.toIso8601String(),
    'asal': asal,
    'awal': awal.toIso8601String(),
    'akhir': akhir.toIso8601String(),
    'deskripsi': deskripsi,
  };
}
