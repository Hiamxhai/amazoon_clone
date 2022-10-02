import 'package:amazoon_clone/model/product_model.dart';
import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/untils.dart';
import 'package:amazoon_clone/widgets/cost_widget.dart';
import 'package:amazoon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel product;

  const ResultWidget({Key? key,
  required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 3,
                child: Image.network(
                    product.url,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  product.productName,
                  maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    SizedBox(
                        width: screenSize.width / 5,
                        child: FittedBox(
                            child: RatingStarWidget(racting: product.rating))),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(product.noOfRating.toString(),
                        style: TextStyle(
                          color: activeCyanColor
                        ),),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: FittedBox(
                  child: CostWidget(
                      color: Colors.redAccent,
                      cost: product.cost
                  ),
                ),
              )
            ],
      ),
         ),
    );
  }
}
