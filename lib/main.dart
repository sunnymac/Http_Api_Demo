import 'package:flutter/material.dart';
import 'pages/simple_api_page.dart';

import 'pages/data_with_array.dart';

/*
@Date : 06-September-2021
@Author : Sunny Mac

This is HomePage. It Contains different buttons and each button call different api.
All the Pages are created under 'pages' folder.
All the Models to get data from API is created under 'models' folder.

*/

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL API DEMO"),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Click on Below Button to Fatch Data from API.",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimpleApi()),
                  );
                },
                child: Text(
                  "Simple API ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataWithArray()),
                  );
                },
                child: Text(
                  "Simple API 2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () {},
                child: Text(
                  "Simple API",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
