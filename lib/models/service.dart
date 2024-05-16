import 'dart:convert';

class ServiceModel {
  final int id;
  final String title;
  final String content;
  final int seen;
  final String image;
  final DateTime createdAt;

  ServiceModel({
    required this.id,
    required this.title,
    required this.content,
    required this.seen,
    required this.image,
    required this.createdAt,
  });

  ServiceModel copyWith({
    int? id,
    String? title,
    String? content,
    int? seen,
    String? image,
    DateTime? createdAt,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      seen: seen ?? this.seen,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'seen': seen,
      'image': image,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      seen: map['seen'] ?? 0,
      image: map['image'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, title: $title, content: $content, seen: $seen, image: $image, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceModel &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.seen == seen &&
        other.image == image &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        seen.hashCode ^
        image.hashCode ^
        createdAt.hashCode;
  }
}
