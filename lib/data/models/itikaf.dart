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
    id: json['id'],
    user: json['user'],
    nama: json['nama'],
    alamat: json['alamat'],
    telepon: json['telepon'],
    tanggalLahir: json['tanggalLahir'],
    asal: json['asal'],
    awal: json['awal'],
    akhir: json['akhir'],
    deskripsi: json['deskripsi'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'nama': nama,
    'alamat': alamat,
    'telepon': telepon,
    'tanggalLahir': tanggalLahir,
    'asal': asal,
    'awal': awal,
    'akhir': akhir,
    'deskripsi': deskripsi,
  };
}
