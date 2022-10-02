import 'package:amazoon_clone/model/product_model.dart';
import 'package:amazoon_clone/screens/cart_screen.dart';
import 'package:amazoon_clone/screens/home_screen.dart';
import 'package:amazoon_clone/screens/more_screen.dart';
import 'package:amazoon_clone/widgets/simple_product_widget.dart';
import 'package:flutter/material.dart';

import '../screens/account_screen.dart';

const double kAppBarHeight = 80;

const List<String> categoriesList = [
  "Prime",
  "Mobiles",
  "Fashion",
  "Electronics",
  "Home",
  "Fresh",
  "Appliances",
  "Books, Toys",
  "Essential"
];

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];

const List<String> largeAds = [
  "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
];

const List<String> smallAds = [
  "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
  "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
  "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
  "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
];

const List<String> adItemNames = [
  "Amazon Pay",
  "Recharge",
  "Rewards",
  "Pay Bills"
];

//Dont even attemp to scroll to the end of this manually lmao
const String amazonLogo =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png";

const String amazonLogoUrl =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png";
const String avartar =
    "https://static.wixstatic.com/media/9d8ed5_abfcc2d6282246e69258c3b491972237~mv2.png/v1/fill/w_600,h_843,al_c/9d8ed5_abfcc2d6282246e69258c3b491972237~mv2.png";
const String avatarSmall ="data:image/png;base64,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";

    List<Widget> testChildren = [
  SimpleProductWidget(productModel:
  ProductModel(
      url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
      productName: "Romantic Glossy Red Keyboard",
      cost: 45000000,
      discount: 0,
      uid: "okok",
      sellerName: "Hei Seller",
      sellerUid: "0191304id",
      rating: 1, noOfRating: 1
  ),),
  SimpleProductWidget(productModel:
  ProductModel(
      url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
      productName: "Romantic Glossy Red Keyboard",
      cost: 45000000,
      discount: 0,
      uid: "okok",
      sellerName: "Hei Seller",
      sellerUid: "0191304id",
      rating: 1, noOfRating: 1
  ),),
  SimpleProductWidget(productModel:
  ProductModel(
      url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
      productName: "Romantic Glossy Red Keyboard",
      cost: 45000000,
      discount: 0,
      uid: "okok",
      sellerName: "Hei Seller",
      sellerUid: "0191304id",
      rating: 1, noOfRating: 1
    ),),
   SimpleProductWidget(productModel:
   ProductModel(
      url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
      productName: "Romantic Glossy Red Keyboard",
      cost: 45000000,
      discount: 0,
      uid: "okok",
      sellerName: "Hei Seller",
      sellerUid: "0191304id",
      rating: 1, noOfRating: 1
  ),),
  SimpleProductWidget(productModel:
  ProductModel(
      url: "https://images-na.ssl-images-amazon.com/images/I/81koxZ07WAL.png",
      productName: "Romantic Glossy Red Keyboard",
      cost: 45000000,
      discount: 0,
      uid: "okok",
      sellerName: "Hei Seller",
      sellerUid: "0191304id",
      rating: 1, noOfRating: 1
  ),),
];

List<String> keyofRating  = [
  "Very bad",
  "Bad",
  "Averge",
  "Good",
  "Exelled"
];




// SimpleProductWidget(
// url:
// "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
// SimpleProductWidget(
// url:
// "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png"),
// SimpleProductWidget(
// url:
// "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png"),
// SimpleProductWidget(
// url:
// "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png"),
// SimpleProductWidget(
// url:
// "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
// SimpleProductWidget(
// url:
// "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),