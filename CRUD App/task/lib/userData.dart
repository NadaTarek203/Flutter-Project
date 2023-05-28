import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/userClass.dart';
class listData extends StatefulWidget {
  const listData({Key? key}) : super(key: key);

  @override
  State<listData> createState() => _listDataState();
}

class _listDataState extends State<listData> {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 200,
      color: Colors.deepPurple[200],
      child: Column(
        children: [
          Row(
            children: [
              Text("User Name"),

            ],
          )
        ],
      ),
    ),
    );
  }
}
