/*
@Date : 06-September-2021
@Author : Sunny Mac

This is Model for Simple Api. 
Api Link : https://mocki.io/v1/be212c0f-4ff6-476a-a79c-d2227f45e43b
Api have simple Key Value data.

*/

class SimpleApiModel {
  int? one;
  int? two;
  bool? check;

  SimpleApiModel({this.one, this.two, this.check});

  SimpleApiModel.fromJson(Map<String, dynamic> json) {
    one = json['one'];
    two = json['two'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['one'] = this.one;
    data['two'] = this.two;
    data['check'] = this.check;
    return data;
  }
}
