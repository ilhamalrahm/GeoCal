import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Triangle());
}

class Triangle extends StatefulWidget {
  Triangle({Key key}) : super(key: key);

  @override
  _Triangle createState() => _Triangle();
}

class _Triangle extends State<Triangle> {
  double area = 0, l11, l22, l33, s = 0, inradius = 0, circumradius = 0;

  final l1 = TextEditingController();
  final l2 = TextEditingController();
  final l3 = TextEditingController();
  void _answer() {
    setState(() {
      if (l1.text == '' || l2.text == '' || l3.text == '') {
        l11 = 0;
        l22 = 0;
        l33 = 0;
      } else {
        l11 = double.tryParse(l1.text);
        l22 = double.tryParse(l2.text);
        l33 = double.tryParse(l3.text);
        if (l11 == null || l22 == null || l33 == null) {
          l11 = 0;
          l22 = 0;
          l33 = 0;
        }
      }

      s = (l11 + l22 + l33) / 2;
      area = double.parse(
          sqrt(s * (s - l11) * (s - l22) * (s - l33)).toStringAsFixed(3));
      inradius = double.parse((area / s).toStringAsFixed(3));
      circumradius =
          double.parse(((l11 * l22 * l33) / (4 * area)).toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Triangle",
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
              fit: BoxFit.fitWidth),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                  child: Image.asset("Assets/Images/inradius.png"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        "  L1 = ",
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
                          controller: l1,
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
                  shadowColor: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " L2 = ",
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
                          controller: l2,
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
                  shadowColor: Colors.blue[200],
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        "  L3 = ",
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
                          controller: l3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.calculate),
                onPressed: _answer,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.blue[200],
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
                  shadowColor: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " Inradius = ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$inradius',
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
                  shadowColor: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " Circumradius = ",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$circumradius',
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
