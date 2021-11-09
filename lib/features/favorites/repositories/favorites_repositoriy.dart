import 'package:robin_book/core/errors/failure.dart';
import 'package:robin_book/features/favorites/data_sources/favorites_data_sources.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepository{
  Future<Either<Failure, List<Doct>>> addBook({required Doct doct});
}

class FavoritesRepositoryImpl extends FavoritesRepository{
  FavoritesRepositoryImpl({required this.dataSources});

  final FavoritesDataSources dataSources;

  @override
  Future<Either<Failure, List<Doct>>> addBook({required Doct doct}) async{
    try {
      final resBook = await dataSources.addFavorites(doct);
      return Right(resBook);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

}