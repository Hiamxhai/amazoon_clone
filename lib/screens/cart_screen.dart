import 'package:amazoon_clone/model/product_model.dart';
import 'package:amazoon_clone/model/user_details_model.dart';
import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/constants.dart';
import 'package:amazoon_clone/widgets/cart_item_widget.dart';
import 'package:amazoon_clone/widgets/custom_main_button.dart';
import 'package:amazoon_clone/widgets/search_bar_widget.dart';
import 'package:amazoon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
          isReadOnly: false,
          hasbackButton: true),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                      child: Text("Proceed to by (n) items"),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: (){

                      }
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemCount: 5,itemBuilder: (context,index) {
                      return CartItemWidget(
                        product: ProductModel(
                            url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
                            productName: "Romantic Glossy Red Keyboard",
                            cost: 45000000,
                            discount: 0,
                            uid: "okok",
                            sellerName: "Hei Seller",
                            sellerUid: "0191304id",
                            rating: 1, noOfRating: 1
                        ),
                      );
                  }),
                ),
              ],
            ),
            UserDetailsBar(
                offset: 0,
            ),
          ],
        )
      ),
    );
  }
}
