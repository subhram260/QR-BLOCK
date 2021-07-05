import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_block/NewCard.dart';
import 'package:qr_block/QrPage.dart';

import 'Constrains.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    // var data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Generate",
          style: TextStyle(color: textGray),
        ),
        centerTitle: true,
        // leading: Icon(Icons.menu,color: Colors.black,),
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Container(
            // margin: EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/icons/menu.svg",
              color: textGray,
            ),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
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
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(datas.length, (index) {
          return NewCard(
            data: datas[index],
          );
        }),
      ),
    );
  }
}

class Data {
  final String title;
  final IconData icon;
  final Widget press;

  const Data({required this.press, required this.title, required this.icon});
}

List<Data> datas = [
  const Data(
    title: "Message",
    icon: Icons.message_outlined,
    press: QrPage(cetegory: "Message"),
  ),
  const Data(
    title: "Email",
    icon: Icons.email_outlined,
    press: QrPage(cetegory: "Email"),
  ),
  const Data(
    title: "Contacts",
    icon: Icons.contacts_outlined,
    press: QrPage(cetegory: "Contacts"),
  ),
  const Data(
    title: "Phone",
    icon: Icons.local_phone_outlined,
    press: QrPage(cetegory: "Phone"),
  ),
  const Data(
    title: "Website URL",
    icon: Icons.web,
    press: QrPage(cetegory: "Website URL"),
  ),
  const Data(
    title: "Image",
    icon: Icons.image_outlined,
    press: QrPage(cetegory: "Image"),
  ),

  // const Data(
  //   title: "Website URL",
  //   icon: Icons.web,
  //   press: QrPage(cetegory: "Website URL"),
  // ),
  // const Data(
  //   title: "Image",
  //   icon: Icons.image_outlined,
  //   press: QrPage(cetegory: "Image"),
  // ),
  // const Data(
  //   title: "Message",
  //   icon: Icons.message_outlined,
  //   press: QrPage(cetegory: "Message"),
  // ),
  // const Data(title: "Email", icon: Icons.email_outlined),
  // const Data(title: "Email", icon: Icons.email_outlined),
  // const Data(title: "Email", icon: Icons.email_outlined),
  // const Data(title: "Email", icon: Icons.email_outlined),
];
