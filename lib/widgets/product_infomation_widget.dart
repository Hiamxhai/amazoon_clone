import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/untils.dart';
import 'package:amazoon_clone/widgets/cost_widget.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget({Key? key,
  required this.productName,
  required this.cost,
  required this.sellerName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSie = Utils().getScreenSize();
    SizedBox spaceThingy = const SizedBox(
      height: 7,
    );
    return SizedBox(
      width: screenSie.width/2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text( productName,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.7,
                overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: CostWidget(
                  color: Colors.black,
                  cost: cost),
            ),
          ),
          spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: "Sold by ",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14
                  )
                ),
                TextSpan(text: sellerName,
                    style: const TextStyle(
                        color: activeCyanColor,
                        fontSize: 14
                    )
                )
              ]
            ),),
          )
        ],
      ),
    );
  }
}