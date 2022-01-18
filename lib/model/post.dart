import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postUrl;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.postId,
    required this.username,
    required this.profImage,
    required this.likes,
    required this.postUrl,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "descrtiption": description,
        "postId": postId,
        "profImage": profImage,
        "postUrl": postUrl,
        "likes": likes,
        "datePublished": datePublished,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
      postUrl: snapshot['postUrl'],
      datePublished: snapshot['datePublished'],
    );
  }
}
