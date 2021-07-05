// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_block/Constrains.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'scan.dart';

class AfterScan extends StatelessWidget {
  const AfterScan({Key? key, required this.barcode, this.controller})
      : super(key: key);

  final barcode;
  final QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // _onbackPressed();
        await controller!.resumeCamera();
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            "",
            style: TextStyle(color: textGray),
          ),
          centerTitle: true,
          // leading: Icon(Icons.menu,color: Colors.black,),
          // automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Container(
              // margin: EdgeInsets.all(14),
              child: Icon(
                Icons.arrow_back,
                color: textGray,
              ),
            ),
            onPressed: () async {
              Navigator.pop(context);
              await controller!.resumeCamera();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/github.svg",
                  color: textGray,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // color: white,
                  child: Text(
                    // "${barcode!.code}",
                    "Barcode Data",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  // color: white,
                  child: Text(
                    // "${barcode!.code}",
                    "${barcode!.code}",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: white,
                  child: Text(
                    // "${barcode!.code}",
                    "Barcode Format :  ",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  // color: white,
                  child: Text(
                    // "${barcode!.code}",
                    " ${barcode!.format}",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Container(
                //   color: white,
                //   child: Text(
                //     // "${barcode!.code}",
                //     "${barcode!.rawBytes}",
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> _onbackPressed() async {
  //   final shouldpop = await showDialog(
  //       builder: (context) => AlertDialog(
  //             title: Text("sdfcs"),
  //             content: Text("sdfcs"),
  //             actions: <Widget>[
  //               FlatButton(onPressed: () {}, child: Text("NO"))
  //             ],
  //           ),
  //       context: context);
  //   // await controller!.resumeCamera();
  //   return shouldpop ?? false;
  // }
  // void _onbackPressed() async {
  //   await controller!.resumeCamera();
  //   Navigator.pop(context);
  // }
}
