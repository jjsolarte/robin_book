import 'package:flutter/material.dart';
import 'package:robin_book/features/favorites/bloc/favorites_bloc.dart';
import 'package:robin_book/features/favorites/bloc/favorites_logic.dart';
import 'package:robin_book/features/favorites/data_sources/favorites_data_sources.dart';
import 'package:robin_book/features/favorites/repositories/favorites_repositoriy.dart';
import 'package:robin_book/features/search/bloc/search_bloc.dart';
import 'package:robin_book/features/search/bloc/search_logic.dart';
import 'package:robin_book/features/search/data_sources/search_data_source.dart';
import 'package:robin_book/features/search/repositories/search_repository.dart';
import 'package:robin_book/ui/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchRepository searchRepository =
        SearchRepositoryImpl(dataSource: SearchDataSourceImpl());
    FavoritesRepository favoritesRepository =
        FavoritesRepositoryImpl(dataSources: FavoritesDataSourcesImpl());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return SearchBloc(
              searchLogic:
                  SearchInitialLogic(searchRepository: searchRepository));
        }),
        BlocProvider(create: (context) {
          return FavoritesBloc(
              logic: FavoritesLogicImpl(repository: favoritesRepository));
        }),
      ],
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const MaterialSettings()),
    );
  }
}

class MaterialSettings extends StatelessWidget {
  const MaterialSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeUi(),
    );
  }
}
