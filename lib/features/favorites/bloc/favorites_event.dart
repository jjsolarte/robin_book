part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class FavoritesAddEvent extends FavoritesEvent {
  const FavoritesAddEvent({required this.doct});

  final Doct doct;

  @override
  List<Object?> get props => [doct];
}
