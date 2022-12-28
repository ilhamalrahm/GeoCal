import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Sphere());
}

class Sphere extends StatefulWidget {
  Sphere({Key key}) : super(key: key);

  @override
  _Sphere createState() => _Sphere();
}

class _Sphere extends State<Sphere> {
  double r;
  double area = 0, volume = 0;
  final radius = TextEditingController();
  void _area() {
    setState(() {
      if (radius.text != '') {
        r = double.tryParse(radius.text);
        if (r == null) {
          r = 0;
        }
      } else {
        r = 0;
      }
      area = double.parse((4 * pi * (r * r)).toStringAsFixed(4));
      volume = double.parse((4 / 3 * pi * (r * r * r)).toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Circle",
            style: TextStyle(fontSize: 27),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "Assets/Images/Mathematics-iphone-wallpaper-ilikewallpaper_com.jpg"),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.31,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.red,
                  elevation: 3,
                  child: Image.asset("Assets/Images/sphere.png"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        "  Radius = ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.white,
                          ),
                          controller: radius,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.calculate),
                onPressed: _area,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " Area = ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$area',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " Volume = ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$volume',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
