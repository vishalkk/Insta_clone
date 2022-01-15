import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? email;
  final String? uid;
  final String? photoUrl;
  final String? username;
  final String? bio;
  final List? followers;
  final List? following;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = (snap.data() as Map<String, dynamic>);
    return User(
      username: snapshot['username'] as String,
      email: snapshot['email'] as String,
      photoUrl: snapshot['photoUrl'] as String,
      bio: snapshot['bio'] as String,
      following: snapshot['following'] as List,
      followers: snapshot['followers'] as List,
      uid: snapshot['uid'] as String,
    );
  }
}
