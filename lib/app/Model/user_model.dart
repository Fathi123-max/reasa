// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:reasa/app/data/assets_path.dart';

class User {
  int id;
  String phoneNumber;
  String name;
  String image;
  User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.image,
  });

  User copyWith({
    int? id,
    String? phoneNumber,
    String? name,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      phoneNumber: map['phoneNumber'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, phoneNumber: $phoneNumber, name: $name, image: $image)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phoneNumber == phoneNumber &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ phoneNumber.hashCode ^ name.hashCode ^ image.hashCode;
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
  id: 0,
  name: 'currentuser',
  image: CustomAssets.charalett,
  phoneNumber: '',
);

User angelina = User(
  id: 1,
  name: 'Lauralee Quintero',
  image: CustomAssets.charalett,
  phoneNumber: '',
);
User rohan = User(
  id: 2,
  name: "Annabel Rohan",
  image: CustomAssets.natprofile,
  phoneNumber: '',
);
User alfonzo = User(
  id: 3,
  name: "Alfonzo Schuessler",
  image: CustomAssets.lauratee,
  phoneNumber: '',
);
User anguestina = User(
  id: 4,
  name: "Augustina Midgett",
  image: CustomAssets.ailee,
  phoneNumber: '',
);
User rodalfo = User(
  id: 5,
  name: "Freida Varnes",
  image: CustomAssets.rodalfo,
  phoneNumber: '',
);
User tanner = User(
    id: 6,
    name: 'Tanner Stafford',
    image: CustomAssets.charalett,
    phoneNumber: '');
User ordonez = User(
    id: 7,
    name: 'Sanjuanita Ordonez',
    image: CustomAssets.rodalfo,
    phoneNumber: '');
User dorrance = User(
    id: 8,
    name: 'Florencio Dorrance',
    image: CustomAssets.natprofile,
    phoneNumber: '');
User clinton = User(
    id: 9, name: 'Clinton Mcclure', image: CustomAssets.ailee, phoneNumber: '');
