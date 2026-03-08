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

  static const int refreshPage = 60;
  static const String khutbahtulHajah =
      "ﺇِﻥَّ ﺍﻟْﺤَﻤْﺪَ ﻟِﻠَّﻪِ ﻧَﺤْﻤَﺪُﻩُ ﻭَﻧَﺴْﺘَﻌِﻴْﻨُﻪُ ﻭَﻧَﺴْﺘَﻐْﻔِﺮُﻩْ ﻭَﻧَﻌُﻮﺫُ ﺑِﺎﻟﻠﻪِ ﻣِﻦْ ﺷُﺮُﻭْﺭِ ﺃَﻧْﻔُﺴِﻨَﺎ ﻭَﻣِﻦْ ﺳَﻴِّﺌَﺎﺕِ ﺃَﻋْﻤَﺎﻟِﻨَﺎ، ﻣَﻦْ ﻳَﻬْﺪِﻩِ ﺍﻟﻠﻪُ ﻓَﻼَ ﻣُﻀِﻞَّ ﻟَﻪُ ﻭَﻣَﻦْ ﻳُﻀْﻠِﻞْ ﻓَﻼَ ﻫَﺎﺩِﻱَ ﻟَﻪُ. ﺃَﺷْﻬَﺪُ ﺃَﻥَّ ﻻَ ﺇِﻟَﻪَ ﺇِﻻَّ ﺍﻟﻠﻪ ﻭَﺃَﺷْﻬَﺪُ ﺃَﻥَّ ﻣُﺤَﻤَّﺪًﺍ ﻋَﺒْﺪُﻩُ ﻭَﺭَﺳُﻮْﻟُﻪُ. ﻳَﺎﺃَﻳُّﻬﺎَ ﺍﻟَّﺬِﻳْﻦَ ﺀَﺍﻣَﻨُﻮﺍ ﺍﺗَّﻘُﻮﺍ ﺍﻟﻠﻪَ ﺣَﻖَّ ﺗُﻘَﺎﺗِﻪِ ﻭَﻻَ ﺗَﻤُﻮْﺗُﻦَّ ﺇِﻻَّ ﻭَﺃَﻧﺘُﻢْ ﻣُّﺴْﻠِﻤُﻮْﻥَ. ﻳَﺎﺃَﻳُّﻬَﺎ ﺍﻟﻨَّﺎﺱُ ﺍﺗَّﻘُﻮْﺍ ﺭَﺑَّﻜُﻢُ ﺍﻟَّﺬِﻱْ ﺧَﻠَﻘَﻜُﻢْ ﻣِّﻦْ ﻧَﻔْﺲٍ ﻭَﺍﺣِﺪَﺓٍ ﻭَﺧَﻠَﻖَ ﻣِﻨْﻬَﺎ ﺯَﻭْﺟَﻬَﺎ ﻭَﺑَﺚَّ ﻣِﻨْﻬُﻤَﺎ ﺭِﺟَﺎﻻً ﻛَﺜِﻴْﺮًﺍ ﻭَﻧِﺴَﺂﺀً ﻭَﺍﺗَّﻘُﻮﺍ ﺍﻟﻠﻪَ ﺍﻟَّﺬِﻱْ ﺗَﺴَﺂﺀَﻟُﻮْﻥَ ﺑِﻪِ ﻭَﺍْﻷَﺭْﺣَﺎﻡَ ﺇِﻥَّ ﺍﻟﻠﻪَ ﻛَﺎﻥَ ﻋَﻠَﻴْﻜُﻢْ ﺭَﻗِﻴْﺒًﺎ. ﻳَﺎﺃَﻳُّﻬَﺎ ﺍﻟَّﺬِﻳْﻦَ ﺀَﺍﻣَﻨُﻮﺍ ﺍﺗَّﻘُﻮﺍ ﺍﻟﻠﻪَ ﻭَﻗُﻮْﻟُﻮْﺍ ﻗَﻮْﻻً ﺳَﺪِﻳْﺪًﺍ. ﻳُﺼْﻠِﺢْ ﻟَﻜُﻢْ ﺃَﻋْﻤَﺎﻟَﻜُﻢْ ﻭَﻳَﻐْﻔِﺮْ ﻟَﻜُﻢْ ﺫُﻧُﻮْﺑَﻜُﻢْ ﻭَﻣَﻦْ ﻳُﻄِﻊِ ﺍﻟﻠﻪَ ﻭَﺭَﺳُﻮْﻟَﻪُ ﻓَﻘَﺪْ ﻓَﺎﺯَ ﻓَﻮْﺯًﺍ ﻋَﻈِﻴْﻤًﺎ.   ﺃَﻣَّﺎ ﺑَﻌْﺪُ؛ ﻓَﺈِﻥَّ ﺃَﺻْﺪَﻕَ ﺍﻟْﺤَﺪِﻳْﺚِ ﻛِﺘَﺎﺏُ ﺍﻟﻠﻪِ ﻭَﺧَﻴْﺮَ ﺍﻟْﻬَﺪﻱِ ﻫَﺪْﻱُ ﻣُﺤَﻤَّﺪٍ ﺻَﻞَّ ﺍﻟﻠﻪُ ﻋَﻠَﻴْﻪِ ﻭَﺳَﻠَّﻢَ، ﻭَﺷَﺮَّ ﺍﻷُﻣُﻮْﺭِ ﻣُﺤَﺪَﺛَﺎﺗُﻬَﺎ، ﻭَﻛُﻞَّ ﻣُﺤْﺪَﺛَﺔٍ ﺑِﺪْﻋَﺔٌ ﻭَﻛُﻞَّ ﺑِﺪْﻋَﺔٍ ﺿَﻼَﻟﺔٍ ﻭَﻛُﻞَّ ﺿَﻼَﻟَﺔٍ ﻓِﻲ ﺍﻟﻨَّﺎﺭِ.";

  static const List<String> khubahtulHajjahDescription = [
    "Sesungguhnya segala puji hanya milik Allah Subhanahu wa Ta’ala Yang kita memuji-Nya, kita memohon pertolongan dan pengampunan dari-Nya, yang kita memohon dari kejelekan jiwa-jiwa kami dan keburukan amal-amal kami. Saya bersaksi bahwasanya tiada Ilah yang Haq untuk di sembah melainkan Ia Subhanahu wa Ta’ala dan tiada sekutu bagi-Nya serta Muhammad Shallallahu ‘alaihi wa salam adalah utusan Allah Subhanahu wa ta’ala",
    "Wahai orang-orang yang beriman bertakwalah kepada Allah dengan sebenar-benar takwa dan janganlah kamu mati kecuali dalam keadaan islam",
    "Wahai sekalian manusia bertakwalah kepada Tuhanmu yang menciptakanmu dari satu jiwa dan menciptakan dari satu jiwa ini pasangannya dan memperkembangbiakkan dari keduanya kaum lelaki yang banyak dan kaum wanita. Maka bertaqwalah kepada Allah yang dengan nama-Nya kamu saling meminta satu sama lain, dan peliharalah hubungan silaturrahim. Sesungguhnya Allah senantiasa menjaga dan mengawasimu - (QS. Ali ‘Imran : 102)",
    "Wahai orang-orang yang beriman bertakwalah kepada Allah dan ucapkanlah perkataan yang benar niscaya Ia akan memperbaiki untuk kalian amal-amal kalian, dan akan mengampuni dosa-dosa kalian, dan barangsiapa yang mentaati Allah dan Rasul-Nya maka baginya kemenangan yang besar - (QS. An-Nisaa’ : 1)",
    "Adapun selanjutnya sebaik baik perkataan adalah kitabullah (Al Qur’an), sebaik baik petunjuk adalah petunjuk Muhammad shallallahu ‘alaihi wa sallam (as sunnah) hati-hatilah kalian dengan perkara baru, karena setiap perkara baru adalah bid’ah, dan setiap bid’ah adalah kesesatan dan setiap kesesatan tempatnya di neraka - (QS. Al-Ahzaab : 70-71)",
    "",
  ];

  static const List<String> syariatSunnahIkhtikaf = [
    "Beragama Islam",
    "Niat, Berakal, dan Tamyiz",
    "Suci dari Haidh dan Nifas",
    "Bagi wanita, memperoleh Izin dari suami dan aman dari fitnah",
    "Dilaksanakan di Masjid",
  ];
  static const String doaMalamLailatulQadar =
      "اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّى";
  static const String deskripsiDoaMalamLailatulQadar =
      "''Ya Allah sesungguhnya Engkau Maha Pemaaf lagi Maha Mulia yang menyukai permintaan maaf, maafkanlah aku''";
}
