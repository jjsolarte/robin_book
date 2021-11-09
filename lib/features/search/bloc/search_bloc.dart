import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:robin_book/features/search/bloc/search_logic.dart';
import 'package:robin_book/features/search/models/res_search.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchLogic searchLogic;

  SearchBloc({required this.searchLogic}) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    if(event is SearchSearchEvent){
      yield* searchLogic.search(name: event.name);
    }
    if(event is SearchResetEvent){
      yield SearchInitial();
    }
  }
}
