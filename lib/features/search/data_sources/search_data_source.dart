import 'package:robin_book/features/search/models/res_search.dart';
import 'package:dio/dio.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';

abstract class SearchDataSource {
  Future<ResSearch> searchBook({required String name});

  Future<ResSearchTitle> searchTitleBook({required String name});
}

class SearchDataSourceImpl implements SearchDataSource {
  final Dio _dio = Dio();

  @override
  Future<ResSearch> searchBook({required String name}) async {
    final path = 'http://openlibrary.org/search/authors.json?q=$name';
    try {
      final response = await _dio.get(path);
      final data = response.data;
      ResSearch resSearch = ResSearch.fromJson(data as Map<String, dynamic>);
      return resSearch;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ResSearchTitle> searchTitleBook({required String name}) async{
    final path = 'http://openlibrary.org/search.json?title=$name';
    try {
      final response = await _dio.get(path);
      final data = response.data;
      ResSearchTitle resSearch = ResSearchTitle.fromJson(data as Map<String, dynamic>);
      return resSearch;
    } catch (_) {
      rethrow;
    }
  }
}
