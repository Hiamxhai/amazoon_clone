import 'package:amazoon_clone/model/product_model.dart';
import 'package:amazoon_clone/widgets/results_widget.dart';
import 'package:amazoon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key,
  required this.query
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasbackButton: true,
      ),
      body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: RichText(
                    text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Showing results for ",
                      style: TextStyle(
                        fontSize: 17,
                      )
                    ),
                    TextSpan(
                        text:  query,
                        style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.italic
                        )
                    ),
                  ]
                )),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3
                  ),
                  itemBuilder:(context, index) {
                    return ResultWidget(product:
                      ProductModel(
                        url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
                        productName: "KeyBoard Red Gaming",
                        cost: 450,
                        discount: 0,
                        uid: "okok",
                        sellerName: "Hei Seller",
                        sellerUid: "0191304id",
                        rating: 1, noOfRating: 2
                        ),
                      );
                  }
              ),
            )
          ],
      ),
    );
  }
}
