// Future<Null> shareScreenshot() async {
//   setState(() {
//     button1 = true;
//   });
//   try {
//     RenderRepaintBoundary boundary =
//         _globalKey.currentContext.findRenderObject();
//     if (boundary.debugNeedsPaint) {
//       Timer(Duration(seconds: 1), () => shareScreenshot());
//       return null;
//     }
//     ui.Image image = await boundary.toImage();
//     final directory = (await getExternalStorageDirectory()).path;
//     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData.buffer.asUint8List();
//     File imgFile = new File('$directory/screenshot.png');
//     imgFile.writeAsBytes(pngBytes);
//     final RenderBox box = context.findRenderObject();
//     Share.shareFile(File('$directory/screenshot.png'),
//         subject: 'Share ScreenShot',
//         text: 'Hello, check your share files!',
//         sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//   } on PlatformException catch (e) {
//     print("Exception while taking screenshot:" + e.toString());
//   }
//   setState(() {
//     button1 = false;
//   });
// }
