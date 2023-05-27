import 'dart:convert';

import 'package:flutter/foundation.dart';

class Resident {
  String image;
  List<String> imagesOfProperty;
  String location;
  String bedRooms;
  String bathRooms;
  String sizeRoom;
  String owner;
  String name;
  String city;
  String countryTag;
  double rating;
  String description;
  double price;
  String perDayNight;
  bool favourite;
  String lang;
  String lant;

  Resident({
    required this.image,
    required this.imagesOfProperty,
    required this.location,
    required this.bedRooms,
    required this.bathRooms,
    required this.sizeRoom,
    required this.owner,
    required this.name,
    required this.city,
    required this.countryTag,
    required this.rating,
    required this.description,
    required this.price,
    required this.perDayNight,
    required this.favourite,
    required this.lang,
    required this.lant,
  });
  Resident copyWith({
    String? image,
    List<String>? imagesOfProperty,
    String? location,
    String? bedRooms,
    String? bathRooms,
    String? sizeRoom,
    String? owner,
    String? name,
    String? city,
    String? countryTag,
    double? rating,
    String? description,
    double? price,
    String? perDayNight,
    bool? favourite,
    String? lang,
    String? lant,
  }) {
    return Resident(
      image: image ?? this.image,
      imagesOfProperty: imagesOfProperty ?? this.imagesOfProperty,
      location: location ?? this.location,
      bedRooms: bedRooms ?? this.bedRooms,
      bathRooms: bathRooms ?? this.bathRooms,
      sizeRoom: sizeRoom ?? this.sizeRoom,
      owner: owner ?? this.owner,
      name: name ?? this.name,
      city: city ?? this.city,
      countryTag: countryTag ?? this.countryTag,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      price: price ?? this.price,
      perDayNight: perDayNight ?? this.perDayNight,
      favourite: favourite ?? this.favourite,
      lang: lang ?? this.lang,
      lant: lant ?? this.lant,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'imagesOfProperty': imagesOfProperty,
      'location': location,
      'bedRooms': bedRooms,
      'bathRooms': bathRooms,
      'sizeRoom': sizeRoom,
      'owner': owner,
      'name': name,
      'city': city,
      'countryTag': countryTag,
      'rating': rating,
      'description': description,
      'price': price,
      'perDayNight': perDayNight,
      'favourite': favourite,
      "lang": lang,
      "lant": lant
    };
  }

  factory Resident.fromMap(Map<String, dynamic> map) {
    return Resident(
      image: map['image'] as String,
      imagesOfProperty: List<String>.from(map['imagesOfProperty']),
      location: map['location'] as String,
      bedRooms: map['bedRooms'] as String,
      bathRooms: map['bathRooms'] as String,
      sizeRoom: map['sizeRoom'] as String,
      owner: map['owner'] as String,
      name: map['name'] as String,
      city: map['city'] as String,
      countryTag: map['countryTag'] as String,
      rating: map['rating'] as double,
      description: map['description'] as String,
      price: map['price'] as double,
      perDayNight: map['perDayNight'] as String,
      favourite: map['favourite'] as bool,
      lang: map['lang'] as String,
      lant: map['lant'] as String,
    );
  }
  String toJson() => json.encode(toMap());
  factory Resident.fromJson(String source) =>
      Resident.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return 'Resident(image: $image, imagesOfProperty: $imagesOfProperty, location: $location, '
        'bedRooms: $bedRooms, bathRooms: $bathRooms, sizeRoom: $sizeRoom, owner: $owner, '
        'name: $name, city: $city, countryTag: $countryTag, rating: $rating, description: $description, '
        'price: $price, perDayNight: $perDayNight, favourite: $favourite,lang:$lang,lant:$lant)';
  }

  @override
  bool operator ==(covariant Resident other) {
    if (identical(this, other)) {
      return true;
    }
    return other.image == image &&
        listEquals(other.imagesOfProperty, imagesOfProperty) &&
        other.location == location &&
        other.bedRooms == bedRooms &&
        other.bathRooms == bathRooms &&
        other.sizeRoom == sizeRoom &&
        other.owner == owner &&
        other.name == name &&
        other.city == city &&
        other.countryTag == countryTag &&
        other.rating == rating &&
        other.description == description &&
        other.price == price &&
        other.perDayNight == perDayNight &&
        other.favourite == favourite &&
        other.lang == lang &&
        other.lant == lant;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        imagesOfProperty.hashCode ^
        location.hashCode ^
        bedRooms.hashCode ^
        bathRooms.hashCode ^
        sizeRoom.hashCode ^
        owner.hashCode ^
        name.hashCode ^
        city.hashCode ^
        countryTag.hashCode ^
        rating.hashCode ^
        description.hashCode ^
        price.hashCode ^
        perDayNight.hashCode ^
        favourite.hashCode ^
        lang.hashCode ^
        lant.hashCode;
  }
}
