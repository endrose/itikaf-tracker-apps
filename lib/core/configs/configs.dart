class Configs {
  static const String appName = 'Itikaf Tracker';
  static const String appDescription =
      'Aplikasi untuk memantau kegiatan itikaf selama bulan Ramadan.';
  static const String totalPeserta = "Total Peserta Itikaf";
  static const String totalHadir = "Total Hadir";
  static const String totalTidakHadir = "Total Tidak Hadir";
  static const String timeLine = "Timeline Itikaf";
  static const String peserta = "Daftar Peserta";
  static const String absensi = "Absensi Peserta Itikaf";
  static const String asal = "Asal Peserta Itikaf";
  static final String lastTenNights = "10 Malam Terakhir Ramadhan $currentYear";

  //input Date Time untuk lasttimenighttimeline
  static final DateTime lastTenNightsStart = DateTime(2026, 3, 10);

  static final DateTime lastTenNightsEnd = DateTime(2026, 3, 20);
  //year
  static final int currentYear = DateTime.now().year;

  static const String appAuthor = 'ENDROS';
  static const String username = 'admin';
  static const String password = '123';

  static const String appLicense = 'MIT License';

  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  static const String footerName = "Made with ❤️ by Endros Team";
}
