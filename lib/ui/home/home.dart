import 'package:flutter/material.dart';
import 'package:robin_book/ui/favorites/favorites.dart';
import 'package:robin_book/ui/search/search.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Robin Book'),
      ),
      body: LiquidSwipe(pages: const [
        SearchUI(),
        FavoritesUI()
      ],
        enableLoop: true,
        slideIconWidget: const Icon(Icons.arrow_back, color: Colors.black,),
      ),
    );
  }
}
