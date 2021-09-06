import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:api_demo/models/data_with_array.dart';

/*
@Date : 06-September-2021
@Author : Sunny Mac

This Page is for Data Object with Array.. 
Api Link : https://mocki.io/v1/8cfbca97-215c-452c-bddd-443dbcb62966
Api have Different objects and some object contains some array as value.

*/

class DataWithArray extends StatefulWidget {
  const DataWithArray({Key? key}) : super(key: key);

  @override
  _DataWithArrayState createState() => _DataWithArrayState();
}

class _DataWithArrayState extends State<DataWithArray> {
  late DataWithArrayModel _dataWithArrayModel; // Object of our Model Class
  bool dataReceived = false; //To Check if data received or not

  @override
  void initState() {
    getData(); // Http get method called
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API with Array of Object"),
        backgroundColor: Colors.grey[800],
      ),
      body: dataReceived // checking condition for data received or not
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status : " + _dataWithArrayModel.status.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Message : " + _dataWithArrayModel.msg.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "User Id : " + _dataWithArrayModel.data![0].id.toString(),
                    // data contains array and we need to use null check to avoid errors.
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Id : " + _dataWithArrayModel.data![0].userId.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Title : " + _dataWithArrayModel.data![0].title.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(), // if data not received
            ),
      backgroundColor: Colors.grey[600],
    );
  }

  void getData() async {
    var url = Uri.parse(
        "https://mocki.io/v1/8cfbca97-215c-452c-bddd-443dbcb62966"); //url of api

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        _dataWithArrayModel = DataWithArrayModel.fromJson(
            jsonResponse); //object of our data model used
        dataReceived = true; // change value
      });
    }
  }
}
