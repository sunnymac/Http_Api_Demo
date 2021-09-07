class ArrayOfAllObjectsModel {
  List<Data>? data;

  ArrayOfAllObjectsModel({this.data});

  ArrayOfAllObjectsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
