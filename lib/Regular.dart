import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Regular());
}

class Regular extends StatefulWidget {
  Regular({Key key}) : super(key: key);

  @override
  _Regular createState() => _Regular();
}

class _Regular extends State<Regular> {
  double area = 0,
      N,
      l,
      perimeter = 0,
      inradius = 0,
      circumradius = 0,
      inangle = 0;
  final n = TextEditingController();
  final length = TextEditingController();
  void _answer() {
    setState(() {
      if (n.text != '' || length.text != '') {
        N = double.tryParse(n.text);
        l = double.tryParse(length.text);
        if (N == null || l == null) {
          N = 0;
          l = 0;
        }
      } else {
        N = 0;
        l = 0;
      }
      perimeter = double.parse((N * l).toStringAsFixed(3));
      inradius = double.parse((1 / 2 * l * 1 / tan(pi / N)).toStringAsFixed(3));
      circumradius =
          double.parse((1 / 2 * l * 1 / sin(pi / N)).toStringAsFixed(3));
      area = double.parse(
          (1 / 4 * N * (l * l) * 1 / tan(pi / N)).toStringAsFixed(3));
      inangle = double.parse(((((N - 2)) / N) * 180).toStringAsFixed(3));
    });
  }

  Padding Answers({text, answer}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            " $text = ",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.04,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              '$answer',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Regular Polygon",
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
                  child: Image.asset("Assets/Images/unnamed.jpg"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        "  n = ",
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
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.white,
                          ),
                          controller: n,
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
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " length = ",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.white),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.white,
                          ),
                          controller: length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.calculate),
                onPressed: _answer,
                backgroundColor: Colors.red,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Column(
                    children: [
                      Answers(text: "Perimeter", answer: "$perimeter"),
                      Answers(text: "Inradius", answer: "$inradius"),
                      Answers(text: "Circumradius", answer: "$circumradius"),
                      Answers(text: "Area", answer: "$area"),
                      Answers(text: "Int angle", answer: "$inangle deg"),
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
