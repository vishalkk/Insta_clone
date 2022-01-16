import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? description;
  final String? uid;
  final String? postUrl;
  final String? username;
  final String? postId;
  final datePublished;
  final String profImage;
  final List? likes;

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
    var snapshot = (snap.data() as Map<String, dynamic>);
    return Post(
      username: snapshot['username'] as String,
      uid: snapshot['uid'] as String,
      description: snapshot['description'] as String,
      postId: snapshot['postId'] as String,
      profImage: snapshot['profImage'] as String,
      likes: snapshot['likes'] as List,
      postUrl: snapshot['postUrl'] as String,
      datePublished: snapshot['datePublished'],
    );
  }
}
