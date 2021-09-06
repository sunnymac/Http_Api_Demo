/*
@Date : 06-September-2021
@Author : Sunny Mac

This is Model for Data Object with Array.. 
Api Link : https://mocki.io/v1/8cfbca97-215c-452c-bddd-443dbcb62966
Api have Different objects and some object contains some array as value.

*/

class DataWithArrayModel {
  bool? status;
  String? msg;
  List<Data>? data;

  DataWithArrayModel({this.status, this.msg, this.data});

  DataWithArrayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  int? id;
  String? title;
  String? desc;
  bool? completed;

  Data({this.userId, this.id, this.title, this.desc, this.completed});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['completed'] = this.completed;
    return data;
  }
}
