// {
//     "id": 5,
//     "user": "string updated",
//     "nama": "string updated",
//     "alamat": "string updated",
//     "telepon": "1231312",
//     "tanggalLahir": "2026-03-02T23:15:12.254-06:00",
//     "asal": "string",
//     "awal": "2026-03-02T23:15:12.254-06:00",
//     "akhir": "2026-03-02T23:15:12.254-06:00",
//     "deskripsi": "string"
//   }
class ItikafEntity {
  final int id;
  final String user;
  final String nama;
  final String alamat;
  final String telepon;
  final DateTime tanggalLahir;
  final String asal;
  final DateTime awal;
  final DateTime akhir;
  final String deskripsi;

  ItikafEntity({
    required this.id,
    required this.user,
    required this.nama,
    required this.alamat,
    required this.telepon,
    required this.tanggalLahir,
    required this.asal,
    required this.awal,
    required this.akhir,
    required this.deskripsi,
  });
}
