class DetailsModel {
  String? message;
  Product? product;
  List<User>? user;
  bool? booll;

  DetailsModel({this.message, this.product, this.user, this.booll});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    booll = json['bool'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['bool'] = this.booll;
    return data;
  }
}

class Product {
  int? id;
  String? categoriesId;
  String? productImg;
  String? title;
  String? describtion;
  String? startingPrice;
  String? userId;
  String? address;
  String? nationalImg;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.categoriesId,
      this.productImg,
      this.title,
      this.describtion,
      this.startingPrice,
      this.userId,
      this.address,
      this.nationalImg,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoriesId = json['categories_id'];
    productImg = json['product_img'];
    title = json['title'];
    describtion = json['Describtion'];
    startingPrice = json['StartingPrice'];
    userId = json['user_id'];
    address = json['Address'];
    nationalImg = json['national_img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categories_id'] = this.categoriesId;
    data['product_img'] = this.productImg;
    data['title'] = this.title;
    data['Describtion'] = this.describtion;
    data['StartingPrice'] = this.startingPrice;
    data['user_id'] = this.userId;
    data['Address'] = this.address;
    data['national_img'] = this.nationalImg;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? startingPrice;
  String? productId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.startingPrice,
      this.productId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startingPrice = json['StartingPrice'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['StartingPrice'] = this.startingPrice;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
