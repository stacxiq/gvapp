import 'dart:convert';

class hotelListData {
  String? img, name, desc;

  hotelListData({this.img, this.name, this.desc});
}


class News {
  final int id;
  final String title;
  final String content;
  final int seen;
  final String image;
  final DateTime createdAt;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.seen,
    required this.image,
    required this.createdAt,
  });

  News copyWith({
    int? id,
    String? title,
    String? content,
    int? seen,
    String? image,
    DateTime? createdAt,
  }) {
    return News(
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

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      content: map['content'] is String? map['content'] ?? '' : '',
      seen: map['seen'] ?? 0,
      image: map['image'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, title: $title, content: $content, seen: $seen, image: $image, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
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
