// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:reasa/app/data/assets_path.dart';
import 'package:uuid/uuid.dart';

class User {
  String id;
  String phoneNumber;
  String fullName;
  String image;

  User({
    required this.phoneNumber,
    required this.fullName,
    required this.image,
  }) : id = Uuid().v4();

  User copyWith({
    int? id,
    String? phoneNumber,
    String? name,
    String? image,
  }) {
    return User(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: name ?? this.fullName,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phoneNumber': phoneNumber,
      'name': fullName,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      phoneNumber: map['phoneNumber'] as String,
      fullName: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, phoneNumber: $phoneNumber, name: $fullName, image: $image)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phoneNumber == phoneNumber &&
        other.fullName == fullName &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phoneNumber.hashCode ^
        fullName.hashCode ^
        image.hashCode;
  }
}

List<User> userlist = [
  angelina,
  rohan,
  alfonzo,
  anguestina,
  rodalfo,
  tanner,
  ordonez,
  dorrance,
  clinton
];

User currentuser = User(
  fullName: 'currentuser',
  image: CustomAssets.charalett,
  phoneNumber: '',
);

User angelina = User(
  fullName: 'Lauralee Quintero',
  image: CustomAssets.charalett,
  phoneNumber: '',
);
User rohan = User(
  fullName: "Annabel Rohan",
  image: CustomAssets.natprofile,
  phoneNumber: '',
);
User alfonzo = User(
  fullName: "Alfonzo Schuessler",
  image: CustomAssets.lauratee,
  phoneNumber: '',
);
User anguestina = User(
  fullName: "Augustina Midgett",
  image: CustomAssets.ailee,
  phoneNumber: '',
);
User rodalfo = User(
  fullName: "Freida Varnes",
  image: CustomAssets.rodalfo,
  phoneNumber: '',
);
User tanner = User(
    fullName: 'Tanner Stafford',
    image: CustomAssets.charalett,
    phoneNumber: '');
User ordonez = User(
    fullName: 'Sanjuanita Ordonez',
    image: CustomAssets.rodalfo,
    phoneNumber: '');
User dorrance = User(
    fullName: 'Florencio Dorrance',
    image: CustomAssets.natprofile,
    phoneNumber: '');
User clinton = User(
    fullName: 'Clinton Mcclure', image: CustomAssets.ailee, phoneNumber: '');
