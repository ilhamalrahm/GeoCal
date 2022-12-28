import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Cone());
}

class Cone extends StatefulWidget {
  Cone({Key key}) : super(key: key);

  @override
  _Cone createState() => _Cone();
}

class _Cone extends State<Cone> {
  double volume = 0, r, h, tsa = 0, lsa = 0, l = 0;
  final radius = TextEditingController();
  final height = TextEditingController();
  void _answer() {
    setState(() {
      if (radius.text != '' || height.text != '') {
        r = double.tryParse(radius.text);
        h = double.tryParse(height.text);
        if (r == null || h == null) {
          r = 0;
          h = 0;
        }
      } else {
        r = 0;
        h = 0;
      }
      l = double.parse((sqrt((r * r) + (h * h))).toStringAsFixed(3));
      sqrt((r * r) + (h * h));
      tsa = double.parse((pi * r * (l + r)).toStringAsFixed(3));
      volume = double.parse(((1 / 3 * pi * (r * r)) * h).toStringAsFixed(3));
      lsa = double.parse((pi * r * l).toStringAsFixed(3));
    });
  }

  Padding coneAnswers({text, answer}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            " $text = ",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.07,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              '$answer',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.07,
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
            "Cone",
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
                  child: Image.asset("Assets/Images/cone1.jpg"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.cyan[100],
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
                          cursorColor: Colors.white,
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
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.cyan[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " Height = ",
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
                          controller: height,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.calculate),
                onPressed: _answer,
                backgroundColor: Colors.cyan[100],
                foregroundColor: Colors.black,
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
                      coneAnswers(text: "Slant(l)", answer: "$l"),
                      coneAnswers(text: "TSA", answer: "$tsa"),
                      coneAnswers(text: "LSA", answer: "$lsa"),
                      coneAnswers(text: "Volume", answer: "$volume"),
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
