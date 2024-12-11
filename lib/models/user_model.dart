import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilePicture;
  final String banner;
  final String uid;
  final bool isAuthenticated; // if guest or not
  final int karma;
  final List<String> award;
  UserModel({
    required this.name,
    required this.profilePicture,
    required this.banner,
    required this.uid,
    required this.isAuthenticated,
    required this.karma,
    required this.award,
  });

  UserModel copyWith({
    String? name,
    String? profilePicture,
    String? banner,
    String? uid,
    bool? isAuthenticated,
    int? karma,
    List<String>? award,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      banner: banner ?? this.banner,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      karma: karma ?? this.karma,
      award: award ?? this.award,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePicture': profilePicture,
      'banner': banner,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'karma': karma,
      'award': award,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePicture: map['profilePicture'] as String,
      banner: map['banner'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      karma: map['karma'] as int,
      award: List<String>.from(map['award'] as List<String>),
    );
  }


  @override
  String toString() {
    return 'UserModel(name: $name, profilePicture: $profilePicture, banner: $banner, uid: $uid, isAuthenticated: $isAuthenticated, karma: $karma, award: $award)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePicture == profilePicture &&
        other.banner == banner &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated &&
        other.karma == karma &&
        listEquals(other.award, award);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePicture.hashCode ^
        banner.hashCode ^
        uid.hashCode ^
        isAuthenticated.hashCode ^
        karma.hashCode ^
        award.hashCode;
  }
}
