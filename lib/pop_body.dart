import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popgram/pop_list.dart';

class PopBody extends StatelessWidget{
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