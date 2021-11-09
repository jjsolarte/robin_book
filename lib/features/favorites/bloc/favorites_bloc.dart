import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:robin_book/features/favorites/bloc/favorites_logic.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({required this.logic}) : super(FavoritesInitial());

  FavoritesLogic logic;

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async*{
    if(event is FavoritesAddEvent){
      yield* logic.addBook(doct: event.doct);
    }
  }
}
