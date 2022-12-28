import 'dart:ui';
import 'package:flutter/material.dart';
import 'Rectangle.dart';
import 'Circle.dart';
import 'Triangle.dart';
import 'Cylinder.dart';
import 'Regular.dart';
import 'Cone.dart';
import 'Sphere.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' GeoCal Geometric Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'main',
      routes: {
        'main': (context) => MyHomePage(),
        'rectangle': (context) => Rectangle(),
        'circle': (context) => Circle(),
        'triangle': (context) => Triangle(),
        'cylinder': (context) => Cylinder(),
        'regular': (context) => Regular(),
        'cone': (context) => Cone(),
        'sphere': (context) => Sphere(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Padding pageRoute(
        {Color color, Color textcolor, pushnamed, imgname, textname}) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.91,
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.white24,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, pushnamed);
              },
              child: Column(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 5),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: color,
                      elevation: 3,
                      child: Image.asset(
                        "Assets/Images/$imgname",
                        width: MediaQuery.of(context).size.width * 0.91,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: color,
                          height: 60,
                          width: 200,
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Center(
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      " $textname ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: textcolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            " GeoCal Calculator",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
              ),
              pageRoute(
                color: Colors.deepPurple[300],
                textcolor: Colors.white,
                pushnamed: "cone",
                imgname: "cone1.jpg",
                textname: "          Cone",
              ),
              pageRoute(
                  color: Colors.blue[100],
                  textcolor: Colors.black,
                  pushnamed: "circle",
                  imgname: "introductiontoPCA4.png",
                  textname: "         Circle"),
              pageRoute(
                  color: Colors.blue[900],
                  textcolor: Colors.white,
                  pushnamed: "triangle",
                  imgname: "inradius.png",
                  textname: "        Triangle"),
              pageRoute(
                color: Colors.cyan[100],
                textcolor: Colors.black,
                pushnamed: "cylinder",
                imgname: "CNX_BMath_Figure_09_06_024.png",
                textname: "        Cylinder",
              ),
              pageRoute(
                  color: Colors.deepPurple[900],
                  textcolor: Colors.white,
                  pushnamed: "rectangle",
                  imgname: "area-of-rectangle.png.webp",
                  textname: "      Rectangle"),
              pageRoute(
                color: Colors.black,
                textcolor: Colors.white,
                pushnamed: "regular",
                imgname: "unnamed.jpg",
                textname: "Regular Polygon",
              ),
              pageRoute(
                color: Colors.deepPurple,
                textcolor: Colors.white,
                pushnamed: "sphere",
                imgname: "sphere.png",
                textname: "          Sphere",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
