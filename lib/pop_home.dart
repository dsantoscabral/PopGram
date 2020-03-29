import 'package:flutter/material.dart';
import 'package:popgram/pop_body.dart';

class PopHome extends StatelessWidget {
  final topBar = AppBar(
    backgroundColor: Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: Icon(Icons.camera_alt),
    title: SizedBox(
      height: 35.0, child: Image.asset("assets/images/pop_logo.png"),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: new PopBody(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        //alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(icon: Icon(Icons.home), onPressed: null),
              new IconButton(icon: Icon(Icons.search), onPressed: null,),
              new IconButton(icon: Icon(Icons.add_box), onPressed: null,),
              new IconButton(icon: Icon(Icons.favorite), onPressed: null,),
              new IconButton(icon: Icon(Icons.account_box), onPressed: null)
            ],
          ),
        ),
      ),
    );
  }
}
