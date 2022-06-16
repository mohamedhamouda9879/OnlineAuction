class DetailsModel {
  dynamic id;
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

  DetailsModel(
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

  DetailsModel.fromJson(Map<String, dynamic> json) {
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
