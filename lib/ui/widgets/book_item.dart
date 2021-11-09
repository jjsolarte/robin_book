import 'package:flutter/material.dart';
import 'package:robin_book/features/search/models/res_search.dart';

class BookItem extends StatelessWidget {
  BookItem({required this.doc, Key? key}) : super(key: key);
  Doc doc;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white.withOpacity(0.9),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: SizedBox(
          width: size.width*0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doc.name ?? 'NombreLibro', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const SizedBox(height: 5),
              Text(doc.version.toString(), style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              Text(doc.topWork ?? 'Autor', style: const TextStyle(fontSize: 17), maxLines: 1,),
            ],
          ),
        ),
      ),
    );
  }
}