import 'package:robin_book/features/favorites/models/favorites.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';

abstract class FavoritesDataSources{
 Future<List<Doct>> addFavorites(Doct doct);
}

class FavoritesDataSourcesImpl extends FavoritesDataSources{
  @override
  Future<List<Doct>> addFavorites(Doct doct) {
    try {
      Favoritos.favoritos.add(doct);
      return Future.delayed(const Duration(seconds: 1)).then((value) => Favoritos.favoritos);;
    } catch (_) {
      rethrow;
    }
  }
}