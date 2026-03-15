import 'package:dio/dio.dart';
import 'package:itikaf_tracker/core/configs/url.dart';
import 'package:itikaf_tracker/data/models/absen.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';

abstract class RemoteGoogleSheetServices {
  //
  Future<List<ItikafModels>> fetchItikafDataGoogleSheet();
  //absen
  Future<List<AbsenModels>> fetchAbsenDataGoogleSheet();

  // Future<String> authenticate(String username, String password);
}

class RemoteGoogleSheetServicesImpl implements RemoteGoogleSheetServices {
  late Dio _dio;
  RemoteGoogleSheetServicesImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrlGoogleSheet,
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  }

  @override
  Future<List<ItikafModels>> fetchItikafDataGoogleSheet() async {
    try {
      final response = await _dio.get(Urls.getAllItikafGoogleSheet);

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => ItikafModels.fromJson(json)).toList();
      }

      print("DATA ITIKAF:");
      print(response.data);

      throw Exception('Failed to load itikaf data');
    } catch (e) {
      throw Exception('Error fetching itikaf data: $e');
    }
  }

  @override
  Future<List<AbsenModels>> fetchAbsenDataGoogleSheet() async {
    // TODO: implement fetchAbsenData
    try {
      final response = await _dio.get(Urls.getAllAbsenGoogleSheet);

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => AbsenModels.fromJson(json)).toList();
      }

      print("DATA ABSEN:");
      print(response.data);

      throw Exception('Failed to load absen data');
    } catch (e) {
      throw Exception('Error fetching absen data: $e');
    }
  }
}
