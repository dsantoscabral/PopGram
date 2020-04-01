import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:popgram/pop_album.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:popgram/pop_comments.dart';

Future<List<PopAlbum>> fetchAlbum() async {
  Response response = await get('https://mobile.int.granito.xyz/api/feed/getposts');

  if (response.statusCode == 200) {

    List<dynamic> body = jsonDecode(response.body);
    List<PopAlbum> popAlbuns = body.map((dynamic item) => PopAlbum.fromJson(item)).toList();
    return popAlbuns;

    //return PopAlbum.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Tente mais tarde...');
  }
}

class PopList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var deviceSize = MediaQuery.of(context).size;

    final userImage = "assets/images/pop_user.png";
    Future<List<PopAlbum>> popAlbuns;
    popAlbuns = fetchAlbum();

    Widget projectWidget() {
      return FutureBuilder(
        future: fetchAlbum(),
        builder: (BuildContext context, AsyncSnapshot<List<PopAlbum>> projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          }

          List<PopAlbum> postList = projectSnap.data;

          return ListView.builder(
           itemCount: postList.length,

            itemBuilder: (BuildContext context, index)
            {
              PopAlbum project = projectSnap.data[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            new Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  //color: Colors.black,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(postList[index].photoUri),
                                  )),
                            ),
                            new SizedBox(
                              width: 10.0,
                            ),
                            new Text(
                              project.person.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        new IconButton(
                            icon: Icon(Icons.more_vert), onPressed: null)
                      ],
                    ),
                  ),
                  Image.network(postList[index].person.profilePhotoUri),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Icon(FontAwesomeIcons.heart),
                            new SizedBox(
                              width: 16.0,
                            ),
                            new Icon(FontAwesomeIcons.comment),
                            new SizedBox(
                              width: 16.0,
                            ),
                            new Icon(FontAwesomeIcons.paperPlane)
                          ],
                        ),
                        new Icon(FontAwesomeIcons.bookmark)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Curtido por eu_danisants e outras " + postList[index].likes.toString() + " pessoas",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Curtido por eu_danisants e outras " + postList[index].likes.toString() + " pessoas",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            //color: Colors.black,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(postList[index].photoUri),
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: new TextField(
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              hintText: "Adicionar um comentário...",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return projectWidget();
//    return new ListView.builder(
//      itemCount: projectSnap.data,
//      itemBuilder: (context, index) => index == 0
//          ? new SizedBox(
//              child: new PopStories(),
//              height: deviceSize.height * 0.2,
//            )
//          : Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              mainAxisSize: MainAxisSize.min,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          new Container(
//                            height: 40.0,
//                            width: 40.0,
//                            decoration: new BoxDecoration(
//                                shape: BoxShape.circle,
//                                //color: Colors.black,
//                                image: new DecorationImage(
//                                  fit: BoxFit.fill,
//                                  image: new ExactAssetImage(userImage),
//                                )),
//                          ),
//                          new SizedBox(
//                            width: 10.0,
//                          ),
//                          new Text(
//                            "Ana Clara",
//                            style: TextStyle(fontWeight: FontWeight.bold),
//                          )
//                        ],
//                      ),
//                      new IconButton(
//                          icon: Icon(Icons.more_vert), onPressed: null)
//                    ],
//                  ),
//                ),
//                Flexible(
//                  fit: FlexFit.loose,
//                  child: new Image.asset(
//                    "assets/images/pop_image.png",
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(16.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      new Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          new Icon(FontAwesomeIcons.heart),
//                          new SizedBox(
//                            width: 16.0,
//                          ),
//                          new Icon(FontAwesomeIcons.comment),
//                          new SizedBox(
//                            width: 16.0,
//                          ),
//                          new Icon(FontAwesomeIcons.paperPlane)
//                        ],
//                      ),
//                      new Icon(FontAwesomeIcons.bookmark)
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                  child: Text(
//                    "Curtido por gh_cabral, eu_danisants e outras pessoas",
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      new Container(
//                        height: 40.0,
//                        width: 40.0,
//                        decoration: new BoxDecoration(
//                          shape: BoxShape.circle,
//                          //color: Colors.black,
//                          image: new DecorationImage(
//                            fit: BoxFit.fill,
//                            image: new ExactAssetImage(userImage),
//                          ),
//                        ),
//                      ),
//                      new SizedBox(
//                        width: 10.0,
//                      ),
//                      Expanded(
//                        child: new TextField(
//                          decoration: new InputDecoration(
//                            border: InputBorder.none,
//                            hintText: "Adicionar um comentário...",
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//    );
  }
}
