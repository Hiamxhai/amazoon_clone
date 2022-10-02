import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:amazoon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);
  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();

}
class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double smaillAdHeight = screenSize.width / 4;

    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd == (largeAds.length - 1)) {
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        //Image with gradient
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            backgroundColor,
                            backgroundColor.withOpacity(0)
                          ]
                      )
                  ),
                ),
              ),
            ],
          ),
          Container(

            color: backgroundColor,
            width: screenSize.width,
            height: smaillAdHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmaillAdsFromIndex(0, smaillAdHeight),
                getSmaillAdsFromIndex(1, smaillAdHeight),
                getSmaillAdsFromIndex(2, smaillAdHeight),
                getSmaillAdsFromIndex(3, smaillAdHeight),
              ],
            ),

          )
        ],
      ),
    );
  }
    Widget getSmaillAdsFromIndex(int index, double height) {
      return  Container(
          height: height,
          width: height,
          decoration:
            ShapeDecoration(
              color: Colors.white,
              shadows: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(smallAds[index]),
                const SizedBox(
                  height: 10,
                ),
                Text(adItemNames[index])
              ],
            ),
          ),
        );

    }

}
