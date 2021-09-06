import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:api_demo/models/simple_api_model.dart';

/*
@Date : 06-September-2021
@Author : Sunny Mac

This Page is for Simple Api. 
Api Link : https://mocki.io/v1/be212c0f-4ff6-476a-a79c-d2227f45e43b
Api have simple Key Value data.


*/

class SimpleApi extends StatefulWidget {
  const SimpleApi({Key? key}) : super(key: key);

  @override
  _SimpleApiState createState() => _SimpleApiState();
}

class _SimpleApiState extends State<SimpleApi> {
  late SimpleApiModel _simpleApiModel; // Object of our Model Class
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
        title: Text("Simple API Demo"),
        backgroundColor: Colors.grey[800],
      ),
      body: dataReceived // checking condition for data received or not
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data 1 : " + _simpleApiModel.one.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Data 2 : " + _simpleApiModel.two.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Data 3 : " + _simpleApiModel.check.toString(),
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
        "https://mocki.io/v1/be212c0f-4ff6-476a-a79c-d2227f45e43b"); //url of api

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        _simpleApiModel = SimpleApiModel.fromJson(
            jsonResponse); //object of our data model used
        dataReceived = true; // change value
      });
    }
  }
}
