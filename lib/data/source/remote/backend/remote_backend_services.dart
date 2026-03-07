import 'package:dio/dio.dart';
import 'package:itikaf_tracker/data/models/itikaf.dart';

abstract class RemoteBackendServices {
  // http://itikaftracker.somee.com/api/itikaf
  //
  Future<List<ItikafModels>> fetchItikafData();
}

class RemoteBackendServicesImpl implements RemoteBackendServices {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://itikaftracker.somee.com/api',
      connectTimeout: const Duration(seconds: 5),
    ),
  );
  @override
  Future<List<ItikafModels>> fetchItikafData() async {
    // Simulasi pengambilan data dari backend
    try {
      final response = await _dio.get('/itikaf');
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => ItikafModels.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load itikaf data');
      }
    } catch (e) {
      throw Exception('Error fetching itikaf data: $e');
    }
  }
}
