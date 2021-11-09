part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchSearchState extends SearchState {
  const SearchSearchState({required this.resSearch});

  final ResSearch resSearch;

  @override
  List<Object?> get props => [resSearch];
}

class SearchSearchTitleState extends SearchState {

  const SearchSearchTitleState({required this.resSearch});

  final ResSearchTitle resSearch;

  @override
  List<Object?> get props => [resSearch];
}

class SearchFailureState extends SearchState {
  @override
  List<Object?> get props => [];
}
