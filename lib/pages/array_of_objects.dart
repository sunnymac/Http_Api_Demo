import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:api_demo/models/array_of_objects_model.dart';
/*
@Date : 06-September-2021
@Author : Sunny Mac

This Page display array of objects.
Api Link : https://mocki.io/v1/9a167bed-0d4e-4a3b-8ce4-f51b11c27548
Api have array of different objects.

*/

class ArrayOfObjects extends StatefulWidget {
  const ArrayOfObjects({Key? key}) : super(key: key);

  @override
  _ArrayOfObjectsState createState() => _ArrayOfObjectsState();
}

class _ArrayOfObjectsState extends State<ArrayOfObjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data[index].title.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].desc.toString(),
                                      style: TextStyle(fontSize: 15.0),
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

Future<List<ArrayOfObjectsModel>> getData() async {
  var url = Uri.parse(
      "https://mocki.io/v1/9a167bed-0d4e-4a3b-8ce4-f51b11c27548"); //url of api

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse.toString());
    Iterable list = jsonResponse;
    return list
        .map((singlearray) => ArrayOfObjectsModel.fromJson(singlearray))
        .toList();
  } else {
    print("Fetch data fail");
    throw Exception("Failed!");
  }
}
