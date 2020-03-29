import 'package:popgram/pop_person.dart';

class PopComments {
  final int commentId;
  final int postId;
  final int personId;
  final PopPerson person;

  PopComments(
      {this.commentId,
        this.postId,
        this.personId,
        this.person});

  factory PopComments.fromJson(Map<String, dynamic> json) {
    return PopComments(
      commentId: json['commentId'],
      postId: json['postId'],
      personId: json['personId'],
      person: json['person']
    );
  }
}
