import 'package:robin_book/features/favorites/bloc/favorites_bloc.dart';
import 'package:robin_book/features/favorites/repositories/favorites_repositoriy.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';

abstract class FavoritesLogic{
  Stream<FavoritesState> addBook({required Doct doct});
}

class FavoritesLogicImpl extends FavoritesLogic{
  FavoritesLogicImpl({required this.repository});

  final FavoritesRepository repository;

  @override
  Stream<FavoritesState> addBook({required Doct doct}) async*{
    yield FavoritesLoadingState();
    final search = await repository.addBook(doct: doct);
    yield* search.fold((l) async* {
      yield FavoritesFailureState();
    }, (r) async* {
      yield FavoritesAddState(favorites: r);
    });
    return;
  }

}