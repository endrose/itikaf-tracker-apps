String getMonthAbbreviation(int month) {
  const monthAbbreviations = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des",
  ];
  return monthAbbreviations[month - 1];
}

/// Format: 9 Mar 2026
String formatFullDate(DateTime date) {
  return "${date.day} ${getMonthAbbreviation(date.month)} ${date.year}";
}

//Format 9 Mar 2026 Jam Sekarang
String formatFullDateWithTime(DateTime date) {
  return "${date.day} ${getMonthAbbreviation(date.month)} ${date.year} Jam ${date.hour}:${date.minute.toString().padLeft(2, '0')} WIB";
}

/// Format: 9 Mar
String formatShortDate(DateTime date) {
  return "${date.day} ${getMonthAbbreviation(date.month)} ${date.year}";
}

/// Format: 09/03/2026
String formatNumericDate(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  return "$day/$month/${date.year}";
}

/// Cek apakah malam ganjil (21,23,25,27,29 Ramadhan)
bool isOddNight(DateTime date) {
  return date.day % 2 == 1;
}

/// Cek apakah peserta sedang itikaf
bool isActiveItikaf(DateTime start, DateTime end) {
  final now = DateTime.now();
  return now.isAfter(start) && now.isBefore(end);
}

/// Cek apakah itikaf sudah selesai
bool isFinished(DateTime end) {
  return DateTime.now().isAfter(end);
}
