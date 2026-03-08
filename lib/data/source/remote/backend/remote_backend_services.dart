import 'package:dio/dio.dart';
import 'package:itikaf_tracker/data/models/absen.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';

abstract class RemoteBackendServices {
  // http://itikaftracker.somee.com/api/itikaf
  //
  Future<List<ItikafModels>> fetchItikafData();
  //absen
  Future<List<AbsenModels>> fetchAbsenData();

  //Auth

  Future<String> authenticate(String username, String password);
}

class RemoteBackendServicesImpl implements RemoteBackendServices {
  late Dio _dio;

  String token = '';

  RemoteBackendServicesImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://muslim.rsite.net/api/",
        connectTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          handler.next(options);
        },
      ),
    );
  }

  @override
  Future<String> authenticate(String username, String password) async {
    // TODO: implement authenticate
    try {
      final response = await _dio.post(
        "/Auth/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        token = response.data["token"];
        print("Authenticated successfully, token: $token");
        return token;
      }

      throw Exception("Login failed");
    } catch (e) {
      throw Exception("Auth error $e");
    }
  }

  @override
  Future<List<ItikafModels>> fetchItikafData() async {
    try {
      final response = await _dio.get('/itikaf');

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => ItikafModels.fromJson(json)).toList();
      }

      throw Exception('Failed to load itikaf data');
    } catch (e) {
      throw Exception('Error fetching itikaf data: $e');
    }
  }

  @override
  Future<List<AbsenModels>> fetchAbsenData() async {
    // TODO: implement fetchAbsenData
    try {
      final response = await _dio.get('/absen');

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => AbsenModels.fromJson(json)).toList();
      }

      throw Exception('Failed to load absen data');
    } catch (e) {
      throw Exception('Error fetching absen data: $e');
    }
  }
}
