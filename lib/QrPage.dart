import 'dart:async';
import 'dart:io';
// import 'dart:io';
// // import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_block/NewCard.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
// import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
// import 'package:share/share.dart';

import 'Constrains.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key, required this.cetegory}) : super(key: key);

  final String cetegory;

  @override
  _QrPageState createState() => _QrPageState(cetegory);
}

class _QrPageState extends State<QrPage> {
  final _formkey = GlobalKey<FormState>();
  final globalKey = new GlobalKey();
  int originalSize = 800;

  TextEditingController inputcontroller = new TextEditingController();
  String getvalue = "";
  String cetegory;
  String name = "+91";
  // String namedis = "";

  _QrPageState(this.cetegory);

  @override
  void initState() {
    super.initState();
  }

  Future<Null> shareScreenshot() async {
    // setState(() {
    //   button1 = true;
    // });
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => shareScreenshot());
        return null;
      }
      ui.Image image = await boundary.toImage(pixelRatio: 12.0);
      final directory = (await getApplicationDocumentsDirectory()).path;
      // getExternalStorageDirectory()
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);

      // File dec = new File(path)
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.shareFiles(['$directory/screenshot.png'], text: "$getvalue");
      // Share.shareFile(

      //      File('$directory/screenshot.png'),
      //     subject: 'Share ScreenShot',
      //     text: 'Hello, check your share files!',
      //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
    // setState(() {
    //   button1 = false;
    // });
  }

//   void share_button() async {
//     RenderRepaintBoundary boundary =
//         globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
//     // await
//     ui.Image boximage = await boundary.toImage(pixelRatio: 1);
//     ByteData? byteData =
//         await boximage.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List uint8list = byteData!.buffer.asUint8List();

//     saveAndShare(uint8list);
// }
  // Future<void> share_button() async {
  //   try {
  //     RenderRepaintBoundary boundary = globalKey.currentContext!
  //         .findRenderObject()! as RenderRepaintBoundary;
  //     var image = await boundary.toImage();
  //     ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();
  //     final tempDir = await getTemporaryDirectory();
  //     final file = await new File('${tempDir.path}/image.png').create();
  //     await file.writeAsBytes(pngBytes);

  //      await Share.shareFiles([file.path]);
  //     // await Share.file(_dataString, '$_dataString.png', pngBytes, 'image/png');
  //     // final channel = const MethodChannel('channel:me.alfian.share/share');
  //     // channel.invokeMethod('shareFile', 'image.png');
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   // final tempDir = await getTemporaryDirectory();
  //   // final file = await new File('${tempDir.path}/image.png').create();
  //   //   await file.writeAsBytes(pngBytes);

  //   // await Share.file(_dataString, '$_dataString.png', pngBytes, 'image/png');
  // }

  // Future<void> share_button() async {
  //   try {
  //     RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  //     var image = await boundary.toImage();
  //     ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
  //     Uint8List pngBytes = byteData.buffer.asUint8List();

  //     final tempDir = await getTemporaryDirectory();
  //     final file = await new File('${tempDir.path}/image.png').create();
  //     await file.writeAsBytes(pngBytes);

  //     final channel = const MethodChannel('channel:me.alfian.share/share');
  //     channel.invokeMethod('shareFile', 'image.png');

  //   } catch(e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          cetegory,
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
          onPressed: () {
            Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Center(
            child: Column(
              children: [
                // FloatingActionButton(
                //   onPressed: () {
                //     shareScreenshot();
                //   },
                //   child: Icon(Icons.share),
                // ),
                Spacer(),
                Spacer(),
                RepaintBoundary(
                    key: globalKey, child: ImageQr(getvalue: getvalue)),
                Spacer(),
                switchCatagory(cetegory),
                // message(),
                // email(),
                Spacer(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(), Spacer(),
                    Spacer(),
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: () {
                        download();
                      },
                      child: Icon(Icons.download),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Spacer(),
                    FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: () {
                        shareScreenshot();
                      },
                      child: Icon(Icons.share),
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                  ],
                ),
                // RepaintBoundary(
                //   key: globalKey, child: Icon(Icons.share),),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton:
    );
  }

  printtext() {
    if (getvalue != "") {
      return "$getvalue";
    } else
      return "";
  }

  Column message() {
    return Column(
      children: [
        Container(
          width: 400,
          height: 70,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFDb8b8b8),
                    offset: Offset(0.5, 0.5),
                    blurRadius: 2.0,
                    spreadRadius: 0.02),
                // BoxShadow(
                //   color: Color(0xFFDFFFFFF),
                //   offset: Offset(-2, -2),
                //   blurRadius: 2.0,
                // ),
              ]),
          margin: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    child: TextField(
                      key: _formkey,
                      controller: inputcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter the data"),
                    ),
                  ),
                ),
                // Spacer(),
                ElevatedButton(
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      getvalue = inputcontroller.text;
                    });
                  },
                  child: Text("Generate"),
                ),
                // Spacer()
              ],
            ),
          ),
        ),
        Center(
            child: Text((getvalue == "")
                ? "Please Enter some Data To generate the QR"
                : "Qr code Generated for:")),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            printtext(),
            maxLines: 3,
          ),
        )),
      ],
    );
  }

  Column email() {
    return Column(
      children: [
        Container(
          width: 400,
          height: 85,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFDb8b8b8),
                    offset: Offset(0.5, 0.5),
                    blurRadius: 2.0,
                    spreadRadius: 0.02),
                // BoxShadow(
                //   color: Color(0xFFDFFFFFF),
                //   offset: Offset(-2, -2),
                //   blurRadius: 2.0,
                // ),
              ]),
          margin: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: inputcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter the data"),
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                    ),
                  ),
                ),
                // Spacer(),
                ElevatedButton(
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        getvalue = inputcontroller.text;
                      });
                    } else {
                      // setState(() {
                      //   getvalue = "";
                      // });
                    }
                  },
                  child: Text("Generate"),
                ),
                // Spacer()
              ],
            ),
          ),
        ),
        Center(
            child: Text((getvalue == "")
                ? "Please Enter some Data To generate the QR"
                : "Qr code Generated for:")),
        Center(
            child: Text(
          printtext(),
          maxLines: 3,
        )),
      ],
    );
  }

  Column phone() {
    return Column(
      children: [
        Container(
          width: 400,
          height: 70,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFDb8b8b8),
                    offset: Offset(0.5, 0.5),
                    blurRadius: 2.0,
                    spreadRadius: 0.02),
                // BoxShadow(
                //   color: Color(0xFFDFFFFFF),
                //   offset: Offset(-2, -2),
                //   blurRadius: 2.0,
                // ),
              ]),
          margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Row(
              children: [
                CountryCodePicker(
                  initialSelection: 'IN',
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  onChanged: (e) {
                    // print(e);
                    if (e.toString() == "") {
                    } else {
                      name = e.toString();
                    }
                  },

                  // onInit: (code) => print(name =
                  //     "on init ${code!.name} ${code.dialCode} ${code.name}"),
                ),
                Expanded(
                  child: Form(
                    child: TextField(
                      key: _formkey,
                      controller: inputcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter PhoneNo."),
                    ),
                  ),
                ),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (name != "") {
                        name = name;
                      } else {}

                      print(name.toString());
                      setState(() {
                        if (inputcontroller.text.length == 10) {
                          // name = name;
                          // print(name);
                          // print(name);
                          getvalue = name + inputcontroller.text;
                        } else {
                          // getvalue = "Enter a phone number";
                        }
                      });
                    },
                    child: Text("Generate"),
                  ),
                ),
                // Spacer()
              ],
            ),
          ),
        ),
        Center(
            child: Text((getvalue == "")
                ? "Please Enter some Data To generate the QR"
                : "Qr code Generated for:")),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            printtext(),
            maxLines: 3,
          ),
        )),
      ],
    );
  }

  switchCatagory(String cetegory) {
    switch (cetegory) {
      case 'Message':
        return message();

      // break;
      case 'Email':
        return email();

      case 'Phone':
        return phone();

      // break;
      // default:
    }
  }

  Future<Null> download() async {
    await [Permission.storage].request();

    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => shareScreenshot());
        return null;
      }
      ui.Image image = await boundary.toImage(pixelRatio: 12.0);
      final directory = (await getApplicationDocumentsDirectory()).path;
      // getExternalStorageDirectory()
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);

      // File dec = new File(path)
      final RenderBox box = context.findRenderObject() as RenderBox;
      // Share.shareFiles(['$directory/screenshot.png'], text: "$getvalue");

      final result =
          await ImageGallerySaver.saveImage(pngBytes, name: "$getvalue");
      // final result = await ImageGallerySaver.saveFile(
      //   '$directory/screenshot.png',
      // );
      if (result != null) {
        Fluttertoast.showToast(
            msg: "QR SAVED",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print(result);

      // Share.shareFile(

      //      File('$directory/screenshot.png'),
      //     subject: 'Share ScreenShot',
      //     text: 'Hello, check your share files!',
      //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
  }

  // Future saveAndShare(Uint8List uint8list) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   // final tempDir = await getTemporaryDirectory();
  //   final image = File('${directory.path}/flut.png');
  //   image.writeAsBytesSync(uint8list);

  //   await Share.shareFiles([image.path]);
  // }
}

class ImageQr extends StatelessWidget {
  const ImageQr({
    Key? key,
    required this.getvalue,
  }) : super(key: key);

  final String getvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFDb8b8b8),
              offset: Offset(4, 4),
              blurRadius: 13.0,
              // spreadRadius: 1.0
            ),
            BoxShadow(
              color: Color(0xFFDFFFFFF),
              offset: Offset(-4, -4),
              blurRadius: 13.0,
            ),
          ]),
      padding: EdgeInsets.all(20),
      child: QrImage(
        embeddedImage: AssetImage("assets/icons/logo4.png"),
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size(23, 24),
        ),
        gapless: false,
        data: "$getvalue",
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
