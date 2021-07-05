import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_block/Constrains.dart';
// import 'package:qr_block/QrPage.dart';
import 'package:qr_block/generate.dart';
import 'package:qr_block/scan.dart';

class NavB extends StatefulWidget {
  const NavB({Key? key}) : super(key: key);

  @override
  _NavBState createState() => _NavBState();
}

class _NavBState extends State<NavB> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 48,
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        // margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: textGray,

          // gradient: LinearGradient(
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topCenter,
          //   colors: [Color(0xFFD5e5e5e), Color(0xFFD6f6f6f)],
          // ),
          // borderRadius: BorderRadius.all(Radius.circular(10)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0xFFD4f4f4f),
          //     // offset: Offset(4, 4),
          //     // blurRadius: 5.0,
          //     spreadRadius: 2,
          //   ),
          //   BoxShadow(
          //     color: Color(0xFFDB6B6B6),
          //     // offset: Offset(-4, -4),
          //     // blurRadius: 5.0,
          //     spreadRadius: 1,
          //   ),
          // ]
        ),
        child: ClipRRect(
          // borderRadius: BorderRadius.all(Radius.circular(10)),
          child: DefaultTabController(
            length: 2,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              // color: textGray,
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.black,
                labelColor: white,
                labelStyle: TextStyle(fontSize: 12),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    insets: EdgeInsets.fromLTRB(50, 0, 50, 40)),
                // indicatorColor: Colors.yellow,
                tabs: [
                  Tab(
                    icon: Icon(Icons.qr_code_scanner),
                    text: "Scan",
                  ),
                  Tab(
                    icon: Icon(Icons.qr_code),
                    text: "Generate",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Material(
      //   elevation: 10,
      //   borderRadius: BorderRadius.circular(20),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.grey,
      // items: [
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset("assets/icons/scan.svg"),
      //     title: Text(
      //       "Scan",
      //       style: TextStyle(fontSize: 14, color: white),
      //     ),
      //   ),
      //   BottomNavigationBarItem(
      //     icon: SvgPicture.asset("assets/icons/generate.svg"),
      //     title: Text(
      //       "Generate",
      //       style: TextStyle(fontSize: 14, color: white),
      //     ),
      //   ),
      // ],
      // ),
      // ),

      body: TabBarView(
        children: [
          Scan(),
          Generate(),
        ],
        controller: _tabController,
      ),
    );
  }
}
