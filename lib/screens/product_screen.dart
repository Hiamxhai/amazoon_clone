import 'package:amazoon_clone/model/product_model.dart';
import 'package:amazoon_clone/model/review_model.dart';
import 'package:amazoon_clone/model/user_details_model.dart';
import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/constants.dart';
import 'package:amazoon_clone/utils/untils.dart';
import 'package:amazoon_clone/widgets/cost_widget.dart';
import 'package:amazoon_clone/widgets/custom_main_button.dart';
import 'package:amazoon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazoon_clone/widgets/rating_star_widget.dart';
import 'package:amazoon_clone/widgets/review_dialog.dart';
import 'package:amazoon_clone/widgets/review_widget.dart';
import 'package:amazoon_clone/widgets/search_bar_widget.dart';
import 'package:amazoon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({Key? key,
    required this.productModel
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThing =  Expanded(
      child: Container(
      )
  );
  SizedBox spaceThingy = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
        child: Scaffold(
          appBar: SearchBarWidget(
              isReadOnly: true,
              hasbackButton: true
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: kAppBarHeight - (kAppBarHeight/2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 5),
                                            child: Text(widget.productModel.sellerName,
                                              style: const TextStyle(
                                                  color: activeCyanColor,
                                                  fontSize: 15
                                              ),
                                            ),
                                          ),
                                          Text(widget.productModel.productName,
                                          ),
                                        ],
                                      ),
                                      RatingStarWidget(racting: widget.productModel.rating),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                      height: screenSize.height / 3,
                                      constraints: BoxConstraints(
                                          maxHeight: screenSize.height / 3
                                      ),
                                      child:
                                      Image.network(widget.productModel.url
                                      )
                                  ),
                                ),
                                spaceThingy,
                                CostWidget(
                                    color: Colors.black,
                                    cost: widget.productModel.cost),
                                spaceThingy,
                                CustomMainButton(
                                  child: Text("Buy Now",style: TextStyle(
                                      color: Colors.black
                                  ),),
                                  color: Colors.orange,
                                  isLoading: false,
                                  onPressed: () {},
                                ),
                                spaceThingy,
                                CustomMainButton(
                                  child: Text("Add to cart",style: TextStyle(
                                      color: Colors.black
                                  ),),
                                  color: Colors.yellow,
                                  isLoading: false,
                                  onPressed: () {},
                                ),
                                spaceThingy,
                                CustomSimpleRoundedButton(
                                  onPressed: () {
                                    showDialog(context: context,
                                        builder: (context) =>
                                        const ReviewDialog()
                                    );
                                  },
                                  text: "Add a review for this product",
                                ),
                                SizedBox(
                                  height: screenSize.height,
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return ReviewWidget(
                                          review: ReviewModel(
                                              senderName: "Heii",
                                              description: "Very good product" ,
                                              rating: 3));
                                    }, ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

              ),
              UserDetailsBar(
                  offset: 0,
              )
            ],
          ),
        )
    );
  }
}
