/*
@Date : 06-September-2021
@Author : Sunny Mac

This is Model for Array of objects.
Api Link : https://mocki.io/v1/9a167bed-0d4e-4a3b-8ce4-f51b11c27548
Api have Different objects and some object contains some array as value.

*/

class ArrayOfObjectsModel {
  int? userId;
  int? id;
  String? title;
  String? desc;
  bool? completed;

  ArrayOfObjectsModel(
      {this.userId, this.id, this.title, this.desc, this.completed});

  ArrayOfObjectsModel.fromJson(Map<String, dynamic> json) {
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
