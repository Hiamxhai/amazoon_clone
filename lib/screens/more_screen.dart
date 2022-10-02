import 'package:amazoon_clone/utils/constants.dart';
import 'package:amazoon_clone/widgets/category_widget.dart';
import 'package:amazoon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
          isReadOnly: true,
          hasbackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2 / 3.5,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (context,index) =>
                CategoryWidget(index: index,),
        ),
      ),
    );
  }
}
