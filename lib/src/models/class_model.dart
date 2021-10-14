import 'dart:convert';

import 'package:cloudmate/src/models/user.dart';
import 'package:cloudmate/src/public/constants.dart';

class ClassModel {
  final String id;
  final String name;
  final String topic;
  final String intro;
  final UserModel createdBy;
  final int status;
  final String blurHash;
  final String image;
  final List<String> members;

  ClassModel({
    required this.id,
    required this.name,
    required this.topic,
    required this.intro,
    required this.createdBy,
    required this.status,
    required this.blurHash,
    required this.members,
    required this.image,
  });

  ClassModel copyWith({
    String? id,
    String? name,
    String? topic,
    String? intro,
    UserModel? createdBy,
    int? status,
    String? blurHash,
  }) {
    return ClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      topic: topic ?? this.topic,
      intro: intro ?? this.intro,
      createdBy: createdBy ?? this.createdBy,
      status: status ?? this.status,
      blurHash: blurHash ?? this.blurHash,
      members: this.members,
      image: this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'topic': topic,
      'intro': intro,
      'createdBy': createdBy.toMap(),
      'status': status,
      'blurHash': blurHash,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    late final Map<String, String> defaultImageObject;
    if (map['image'] == '') {
      defaultImageObject = Constants.getOnlyDefaultClassImage();
    }

    return ClassModel(
      id: map['_id'],
      name: map['name'],
      topic: map['topic'],
      intro: map['intro'],
      createdBy: UserModel.fromMap(map['createdBy']),
      status: map['status'],
      blurHash: map['blurHash'] == '' ? defaultImageObject['blurHash'] : map['blurHash'],
      members: ((map['member'] ?? []) as List<dynamic>).map((item) => item.toString()).toList(),
      image: map['image'] == '' ? defaultImageObject['image'] : map['image'],
    );
  }

  factory ClassModel.fromCreatedClass(
    Map<String, dynamic> map,
    UserModel createdBy,
  ) {
    late final Map<String, String> defaultImageObject;
    if (map['image'] == '') {
      defaultImageObject = Constants.getOnlyDefaultClassImage();
    }

    return ClassModel(
      id: map['_id'],
      name: map['name'],
      topic: map['topic'],
      intro: map['intro'],
      createdBy: createdBy,
      status: map['status'],
      blurHash: map['blurHash'] == '' ? defaultImageObject['blurHash'] : map['blurHash'],
      members: [],
      image: map['image'] == '' ? defaultImageObject['image'] : map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) => ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(id: $id, name: $name, topic: $topic, intro: $intro, createdBy: $createdBy, status: $status, blurHash: $blurHash)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassModel &&
        other.id == id &&
        other.name == name &&
        other.topic == topic &&
        other.intro == intro &&
        other.createdBy == createdBy &&
        other.status == status &&
        other.blurHash == blurHash;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        topic.hashCode ^
        intro.hashCode ^
        createdBy.hashCode ^
        status.hashCode ^
        blurHash.hashCode;
  }
}
