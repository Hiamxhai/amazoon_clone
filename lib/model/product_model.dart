class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int noOfRating;

  ProductModel({
    required this.url,
    required this.productName,
    required this.cost,
    required this.discount,
    required this.uid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.noOfRating
  });

  Map<String, dynamic> getJson() {
    return {
      'url' : url,
      'productName' : productName,
      'cost' : cost,
      'discount' : discount.toString(),
      'uid': uid,
      'sellerName': sellerName,
      'sekkerUid': sellerUid,
      'rating': rating,
      'noOfrating': noOfRating,
    };
  }
  factory ProductModel.getModelFromJson({required Map<String,dynamic> json}) {
    return ProductModel(
        url: json["url"],
        productName: json["productName"],
        cost: json["cost"],
        discount: json["discount"],
        uid: json["uid"],
        sellerName: json["sellerName"],
        sellerUid: json["selleruid"],
        rating: json["rating"],
        noOfRating: json["noOFRating"]);
  }
}