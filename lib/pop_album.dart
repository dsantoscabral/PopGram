import 'package:popgram/pop_comments.dart';

import 'pop_person.dart';

class PopAlbum {
  final int postId;
  final int personId;
  final String created;
  final String photoUri;
  final int likes;
  final PopPerson person;
  final List<PopComments> comments;

  PopAlbum(
      {this.postId,
      this.personId,
      this.created,
      this.photoUri,
      this.likes,
      this.person,
      this.comments});

  factory PopAlbum.fromJson(Map<String, dynamic> json) {

    var listComment = json['comments'] as List;
    print(listComment.runtimeType);
    List<PopComments> commentsList = listComment.map((i) => PopComments.fromJson(i)).toList();

    return PopAlbum(
      postId: json['postId'],
      personId: json['personId'],
      created: json['created'],
      photoUri: json['photoUri'],
      likes: json['likes'],
      person: PopPerson.fromJson(json['person']),
      comments: commentsList,
    );
  }
}
