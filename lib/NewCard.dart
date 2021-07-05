import 'package:flutter/material.dart';
import 'package:qr_block/Constrains.dart';

import 'generate.dart';

class NewCard extends StatelessWidget {
  final Data data;

  const NewCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => data.press));
      },
      child: Container(
        color: Colors.transparent,
        // padding: EdgeInsets.all(20),
        child: Card(
          // shape: RoundedRectangleBorder(
          //     side: BorderSide(color: textGray.withOpacity(0.01))),
          elevation: 0.3,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Spacer(),
                // Spacer(),
                Expanded(
                    child: Icon(
                  data.icon,
                  size: 30,
                  color: textGray,
                )),
                // Spacer(),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Text(
                  data.title,
                  style: TextStyle(color: textGray),
                )),
                Spacer(),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
