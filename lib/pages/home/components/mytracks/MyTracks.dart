import 'package:flutter/material.dart';

class MyTracks extends StatelessWidget {
  const MyTracks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
              // spacing to adjust the items below
          SizedBox(
            height: 10,
          ),
    Image.asset('assets/images/img_btns2.png'),
              // spacing to adjust the items below
          SizedBox(
            height: 100,
          ),
          Opacity(opacity: 0.25,
          child:
    Container(
      child: Center( child:
      Column(children: [
          Image.asset('assets/images/img_tracks.png'),
                    SizedBox(
            height: 20,
          ),
          Text("NO LOCAL TRACKS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
          Text("You have 0 local tracks",style: TextStyle(fontSize: 20)),
          ],)
      ),
    )
          )
    ],
    );
  }
}
