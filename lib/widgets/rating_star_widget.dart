import 'package:flutter/material.dart';

class RatingStarWidget extends StatelessWidget {
  final int racting;
  const RatingStarWidget({Key? key,
  required this.racting
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < 5; i++) {
      children
          .add(i < racting
          ? const Icon(Icons.star, color: Colors.orange,)
          : const Icon(Icons.star_border,color: Colors.orange,)
      );
    }

    return Row(
      children: children,
    );
  }
}
