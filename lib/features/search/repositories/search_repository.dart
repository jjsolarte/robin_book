import 'package:robin_book/core/errors/failure.dart';
import 'package:robin_book/features/search/data_sources/search_data_source.dart';
import 'package:robin_book/features/search/models/res_search.dart';
import 'package:dartz/dartz.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';

abstract class SearchRepository {
  Future<Either<Failure, ResSearch>> searchBook({required String name});

  Future<Either<Failure, ResSearchTitle>> searchTitleBook({required String name});
}

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required this.dataSource});

  final SearchDataSource dataSource;

  @override
  Future<Either<Failure, ResSearch>> searchBook({required String name}) async {
    try {
      final resBook = await dataSource.searchBook(name: name);
      return Right(resBook);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResSearchTitle>> searchTitleBook(
      {required String name}) async {
    try {
      final resBook = await dataSource.searchTitleBook(name: name);
      return Right(resBook);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
