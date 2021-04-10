import 'package:flutter/material.dart';

class Others extends StatelessWidget {
  const Others({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          height: 40,
          child: Row(children: [
            Icon(Icons.library_books),
            Text("  Log Book", style: TextStyle(fontSize: 20))
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          height: 40,
          child: Row(children: [
            Icon(Icons.settings),
            Text("  Settings", style: TextStyle(fontSize: 20))
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          height: 40,
          child: Row(children: [
            Icon(Icons.help),
            Text("  Help", style: TextStyle(fontSize: 20))
          ]),
        ),
                        Container(
          margin: EdgeInsets.only(top:10,left:10),
          height: 40,
          child: Row(children: [
            Icon(
              Icons.bug_report
            ),
            Text("  Report Issue",style: TextStyle(fontSize: 20))
          ]),
        ),
                        Container(
          margin: EdgeInsets.only(top:10,left:10),
          height: 40,
          child: Row(children: [
            Icon(
              Icons.star
            ),
            Text("  Rate Us",style: TextStyle(fontSize: 20))
          ]),
        ),
                        Container(
          margin: EdgeInsets.only(top:10,left:10),
          height: 40,
          child: Row(children: [
            Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            Text("  Close enviroCar",style: TextStyle(fontSize: 20,color: Colors.red))
          ]),
        ),
      ],
    );
  }
}
