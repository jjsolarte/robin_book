import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robin_book/features/search/bloc/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robin_book/ui/widgets/book_item.dart';
import 'package:robin_book/ui/widgets/book_item_title.dart';

class SearchUI extends StatefulWidget {
  const SearchUI({Key? key}) : super(key: key);

  @override
  _SearchUIState createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox(
        width: size.width,
        child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Buscar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: size.width * 0.8,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            decoration: const InputDecoration(
                                hintText: 'Nombre o Autor del Libro'),
                            controller: textController,
                            onChanged: (_) => search(),
                          )),
                      Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.height * 0.7,
                    width: size.width * 0.9,
                    child: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          if (state is SearchInitial) {
                            return const Center(
                              child: Text(
                                'Bienvenido a Open Library',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic),
                              ),
                            );
                          } else if (state is SearchLoadingState) {
                            return const Center(child: CircularProgressIndicator(color: Colors.white,));
                          } else if (state is SearchFailureState) {
                            return const Center(
                              child: Text(
                                'Por favor inténtalo más tarde',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic),
                              ),
                            );
                          } else if(state is SearchSearchTitleState){
                            if(state.resSearch.numFound!>1){
                              return ListView.builder(
                                  itemCount: state.resSearch.docs!.length,
                                  itemBuilder: (context, index) {
                                    return BookItemTitle(doc: state.resSearch.docs![index],);
                                  });
                            }else{
                              return const Center(
                                child: Text(
                                  'Ups! No hay resultado',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              );
                            }
                          }else if (state is SearchSearchState) {
                            if(state.resSearch.numFound!>1){
                              return ListView.builder(
                                  itemCount: state.resSearch.docs!.length,
                                  itemBuilder: (context, index) {
                                    return BookItem(doc: state.resSearch.docs![index],);
                                  });
                            }else{
                              return const Center(
                                child: Text(
                                  'Ups! No hay resultado',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              );
                            }
                          } else {
                            return const Center(child: CircularProgressIndicator(color: Colors.white,));
                          }
                        }),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  search() {
    if(textController.text.length>4){
      BlocProvider.of<SearchBloc>(context)
          .add(SearchSearchEvent(name: textController.text));
    }else if(textController.text.isEmpty){
      BlocProvider.of<SearchBloc>(context)
          .add(SearchResetEvent());
    }
  }
}