import 'package:robin_book/features/search/bloc/search_bloc.dart';
import 'package:robin_book/features/search/repositories/search_repository.dart';

abstract class SearchLogic {
  Stream<SearchState> search({required String name});
}

class SearchInitialLogic implements SearchLogic {
  SearchInitialLogic({required this.searchRepository});

  final SearchRepository searchRepository;

  @override
  Stream<SearchState> search({required String name}) async* {
    yield SearchLoadingState();
    final search = await searchRepository.searchTitleBook(name: name);
    yield* search.fold(
      (l) async* {
        yield SearchLoadingState();
        final search = await searchRepository.searchBook(name: name);
        yield* search.fold((l) async* {
          yield SearchFailureState();
        }, (r) async* {
          yield SearchSearchState(resSearch: r);
        });
        return;
      },
      (r) async* {
        yield SearchSearchTitleState(resSearch: r);
      },
    );
  }
}
