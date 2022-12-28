import 'package:flutter/material.dart';

void main() {
  runApp(Rectangle());
}

class Rectangle extends StatefulWidget {
  Rectangle({Key key}) : super(key: key);

  @override
  _Rectangle createState() => _Rectangle();
}

class _Rectangle extends State<Rectangle> {
  int ans = 0, l, b;
  int a = 5;
  final length = TextEditingController();
  final breadth = TextEditingController();
  void _answer() {
    setState(() {
      if (length.text != "") {
        l = int.tryParse(length.text);
        b = int.tryParse(breadth.text);
        if (l == null || b == null) {
          l = 0;
          b = 0;
        }
      } else {
        l = 0;
        b = 0;
      }
      ans = l * b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Rectangle",
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
                  child:
                      Image.asset("Assets/Images/area-of-rectangle.png.webp"),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.91,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.deepPurple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        "  Length = ",
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
                          controller: length,
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
                  shadowColor: Colors.deepPurple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      Text(
                        " Width = ",
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
                          controller: breadth,
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
                  shadowColor: Colors.deepPurple[300],
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
                          '$ans',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.04,
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
