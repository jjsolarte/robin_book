part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchSearchEvent extends SearchEvent {
  const SearchSearchEvent({required this.name});
  final String name;
  @override
  List<Object?> get props => [name];
}

class SearchResetEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}
