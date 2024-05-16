import 'dart:convert';

class User {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? image;
  final String? back_img;
  User([
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.back_img,
  ]);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'back_img': back_img,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] ?? '',
      map['email'] ?? '',
      map['phone'] ?? '',
      map['address'] ?? '',
      map['image'] ?? '',
      map['back_img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email, phone: $phone, address: $address, image: $image, back_img: $back_img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.address == address &&
        other.image == image &&
        other.back_img == back_img;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        image.hashCode ^
        back_img.hashCode;
  }
}
