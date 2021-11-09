import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robin_book/features/favorites/bloc/favorites_bloc.dart';
import 'package:robin_book/features/search/models/res_search.dart';
import 'package:robin_book/features/search/models/res_search_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomModals {
  CustomModals({required this.context});

  BuildContext context;

  void pop({BuildContext? context}) => Navigator.of(context!).pop();

  Future<void> showAlertDialogTitle({
    String title = 'Lo sentimos...',
    String? content = 'Por favor verifica los datos ingresados.',
    bool isDismisible = false,
    VoidCallback? onPressed,
    List<Widget>? actions,
    required Doct doc,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: isDismisible,
      builder: (context) => AlertDialog(
        actions: actions ??
            [
              ElevatedButton(
                onPressed: onPressed ?? () {
                  BlocProvider.of<FavoritesBloc>(context)
                      .add(FavoritesAddEvent(doct: doc));
                },
                child: const Text(
                  'Agregar a Favoritos',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              doc.title ?? title,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Título Sugerido',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(doc.titleSuggest!),
            const SizedBox(height: 15),
            const Text(
              'Código',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(doc.key!),
            const SizedBox(height: 15),
            const Text(
              'Num. Edición',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(doc.editionCount.toString()),
            const SizedBox(height: 15),
            const Text(
              'Año Publicación',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(doc.firstPublishYear.toString()),
          ],
        ),
      ),
    );
  }

  Future<void> showAlertDialog({
    String title = 'Lo sentimos...',
    String? content = 'Por favor verifica los datos ingresados.',
    bool isDismisible = false,
    VoidCallback? onPressed,
    List<Widget>? actions,
    required Doc doc,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: isDismisible,
      builder: (context) => AlertDialog(
        actions: actions ??
            [
              ElevatedButton(
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: onPressed ?? () {},
                child: const Text(
                  'Agregar a Favoritos',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              doc.name ?? title,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            Text(doc.alternateNames!.first),
          ],
        ),
      ),
    );
  }
}
