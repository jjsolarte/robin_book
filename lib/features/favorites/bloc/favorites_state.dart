part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object> get props => [];
}

class FavoritesLoadingState extends FavoritesState{
  @override
  List<Object?> get props => [];
}

class FavoritesAddState extends FavoritesState{
  const FavoritesAddState({required this.favorites});

  final List<Doct> favorites;

  @override
  List<Object?> get props => [favorites];
}

class FavoritesFailureState extends FavoritesState{
  @override
  List<Object?> get props => [];
}