import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:api_demo/models/array_of_all_objects_model.dart';

/*
@Date : 06-September-2021
@Author : Sunny Mac

This Page is for Data Object with Array.. 
Api Link : https://mocki.io/v1/108118f4-1860-43f8-b000-a0ad46db49fb
Api have Different objects and some object contains some array as value.

*/

class ArrayOfAllObjects extends StatefulWidget {
  const ArrayOfAllObjects({Key? key}) : super(key: key);

  @override
  _ArrayOfAllObjectsState createState() => _ArrayOfAllObjectsState();
}

class _ArrayOfAllObjectsState extends State<ArrayOfAllObjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text("Array of All Objects"),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("there is no connection");

                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Center(child: new CircularProgressIndicator());

                  case ConnectionState.done:
                    if (snapshot.data != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              color: Colors.grey[800],
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data.data[index].title
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.data[index].desc.toString(),
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Text("No data was loaded from SharedPreferences");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<ArrayOfAllObjectsModel> getData() async {
  var url = Uri.parse(
      "https://mocki.io/v1/108118f4-1860-43f8-b000-a0ad46db49fb"); //url of api

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse.toString());
    return ArrayOfAllObjectsModel.fromJson(jsonResponse);
  } else {
    print("Fetch data fail");
    throw Exception("Failed!");
  }
}
