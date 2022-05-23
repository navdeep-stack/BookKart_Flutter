import 'package:flutter/material.dart';

import 'category_grid_tile.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
        ),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const CategoryGridTile();
        },
      ),
    );
  }
}
