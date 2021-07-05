import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_block/AfterScan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final qrKey = GlobalKey(debugLabel: "QR");

  QRViewController? controller;

  Barcode? result;

  // @override
  // Future<void> initState() async {
  //   await controller!.resumeCamera();
  //   super.initState();
  // }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult()),
          Positioned(top: 0, child: buildControlButton())
        ],
      ),
    );
  }

  Widget buildControlButton() => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white70),
        child: Row(
          children: [
            Spacer(),
            IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(
                          snapshot.data! ? Icons.flash_on : Icons.flash_off);
                    } else
                      return Container();
                  },
                )),
            Spacer(),
            // IconButton(onPressed: () async {}, icon: Icon(Icons.image)),
            Spacer(),
            IconButton(
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(Icons.cameraswitch_rounded);
                    } else
                      return Container();
                  },
                )),
            Spacer(),
          ],
        ),
      );

  Widget buildResult() => Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white70,
        ),
        child: Text(
          // Result :${result!.code}
          // result != null ? ' ' :
          'Scan a code!',
          maxLines: 3,
          style: TextStyle(fontSize: 15),
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQrViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
            borderWidth: 10,
            borderLength: 20,
            borderRadius: 10),
      );

  void onQrViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen(
      (barcode) => setState(() {
        result = barcode;
        navig(barcode);
      }),
    );
  }

  Future<void> navig(Barcode barcode) async {
    if (result != null) {
      await controller!.pauseCamera();
      // Image image = ;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AfterScan(
                controller: controller,
                barcode: result,
              )));
    }
  }
}
