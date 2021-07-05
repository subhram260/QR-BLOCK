import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_block/Constrains.dart';
import 'package:qr_block/nav.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR BLOCK',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavB())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    color: Colors.black87,
                    height: 80,
                  ),
                  Spacer(),
                  Text(
                    "QR BLOCK",
                    style: TextStyle(
                        fontSize: 20,
                        color: textGray,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Color(0xFFDb8b8b8),
                //     offset: Offset(4, 4),
                //     blurRadius: 8.0,
                //     // spreadRadius: 1.0
                //   ),
                //   BoxShadow(
                //     color: Color(0xFFDE1E1E1),
                //     offset: Offset(-4, -4),
                //     blurRadius: 8.0,
                //   ),
                // ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
