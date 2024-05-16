import 'dart:convert';

class Setting {
  final String key;
  final String value;
  Setting({
    required this.key,
    required this.value,
  });

  Setting copyWith({
    String? key,
    String? value,
  }) {
    return Setting(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      key: map['key'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Setting.fromJson(String source) =>
      Setting.fromMap(json.decode(source));

  @override
  String toString() => 'Setting(key: $key, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Setting && other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
