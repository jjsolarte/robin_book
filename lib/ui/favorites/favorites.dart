import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robin_book/features/favorites/bloc/favorites_bloc.dart';
import 'package:robin_book/features/search/models/res_search.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';
import 'package:robin_book/ui/widgets/book_item_fav.dart';
import 'package:robin_book/ui/widgets/book_item_title.dart';

class FavoritesUI extends StatefulWidget {
  const FavoritesUI({Key? key}) : super(key: key);

  @override
  _FavoritesUIState createState() => _FavoritesUIState();
}

class _FavoritesUIState extends State<FavoritesUI> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Favorites',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 10),
                Container(
                  width: size.width,
                  height: size.height*0.7,
                  color: Colors.white.withOpacity(0.5),
                  child: BlocBuilder<FavoritesBloc, FavoritesState>(builder: (context, state){
                    if(state is FavoritesInitial){
                      BlocProvider.of<FavoritesBloc>(context)
                          .add(FavoritesAddEvent(doct: Doct()));
                      return const Center(
                        child: Text(
                          'Aún no tienes libros favoritos',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                      );
                    }else if(state is FavoritesLoadingState){
                      return const Center(child: CircularProgressIndicator(color: Colors.white,));
                    }else if(state is FavoritesFailureState){
                      return const Center(
                        child: Text(
                          'Por favor inténtalo más tarde',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                      );
                    }else if(state is FavoritesAddState){
                      return ListView.builder(
                          itemCount: state.favorites.length,
                          itemBuilder: (context, index){
                            if(state.favorites[index].title!=null) {
                              return BookItemFav(doc: state.favorites[index]);
                            }else{
                              return Row(
                                children: const [
                                  Text('Mis libros guardados')
                                ],
                              );
                            }
                          });
                    }else{
                      return const Center(
                        child: Text(
                          'Ups! \n Algo no salió bien',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                      );
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
