import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popgram/pop_list.dart';

class PopBody extends StatefulWidget {
  const PopBody({ Key key }) : super(key: key);

  @override
  _PopBody createState() => _PopBody();
}

class _PopBody extends State<PopBody>{
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child: PopList(),)
      ],
    );
  }
}