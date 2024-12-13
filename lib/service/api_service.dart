import 'package:dio/dio.dart';
import '/model/books.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://bookfer.efrosine.my.id/api',
    headers: {'Accept': 'application/json'},
  ));

  Future<List<Books>> getBooks() async {
    try {
      final response = await _dio.get('/books');
      List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Books.fromJson(json)).toList();
    } on DioException catch (e) {
      return Future.error(
          Exception('Failed to load books : ${e.response?.data['message']}'));
    }
    catch (e) {
      return Future.error(Exception('Something whent wrong ${e.toString()}'));
    }
  }
}

