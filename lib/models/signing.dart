class SigningModel {
  String? token;
  int? id;
  String? message;

  SigningModel({this.token, this.id, this.message});

  SigningModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['message'] = this.message;
    return data;
  }
}
