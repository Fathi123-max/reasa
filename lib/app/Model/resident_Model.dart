// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:reasa/app/data/assets_path.dart';

class Resident {
  String image;
  String name;
  String city;
  String countrytag;
  double rating;
  String description;
  double prize;
  String perdayNight;
  bool favourite;
  Resident({
    required this.image,
    required this.name,
    required this.city,
    required this.countrytag,
    required this.rating,
    required this.description,
    required this.prize,
    required this.perdayNight,
    required this.favourite,
  });

  Resident copyWith({
    String? image,
    String? name,
    String? city,
    String? countrytag,
    double? rating,
    String? description,
    double? prize,
    String? perdayNight,
    bool? favourite,
  }) {
    return Resident(
      image: image ?? this.image,
      name: name ?? this.name,
      city: city ?? this.city,
      countrytag: countrytag ?? this.countrytag,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      prize: prize ?? this.prize,
      perdayNight: perdayNight ?? this.perdayNight,
      favourite: favourite ?? this.favourite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'city': city,
      'countrytag': countrytag,
      'rating': rating,
      'description': description,
      'prize': prize,
      'perdayNight': perdayNight,
      'favourite': favourite,
    };
  }

  factory Resident.fromMap(Map<String, dynamic> map) {
    return Resident(
      image: map['image'] as String,
      name: map['name'] as String,
      city: map['city'] as String,
      countrytag: map['countrytag'] as String,
      rating: map['rating'] as double,
      description: map['description'] as String,
      prize: map['prize'] as double,
      perdayNight: map['perdayNight'] as String,
      favourite: map['favourite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resident.fromJson(String source) =>
      Resident.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Resident(image: $image, name: $name, city: $city, countrytag: $countrytag, rating: $rating, description: $description, prize: $prize, perdayNight: $perdayNight, favourite: $favourite)';
  }

  @override
  bool operator ==(covariant Resident other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.name == name &&
        other.city == city &&
        other.countrytag == countrytag &&
        other.rating == rating &&
        other.description == description &&
        other.prize == prize &&
        other.perdayNight == perdayNight &&
        other.favourite == favourite;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        city.hashCode ^
        countrytag.hashCode ^
        rating.hashCode ^
        description.hashCode ^
        prize.hashCode ^
        perdayNight.hashCode ^
        favourite.hashCode;
  }
}

List<Resident> featuredresidents = [modernica, merialla];
List<Resident> recommendedresidents = [
  grandmansion,
  alphahousing,
  millhouse,
  asstute,
  whiteCottage,
  carraigehouse,
  meadowview,
  sweetVilla
];
List<Resident> favouriteresidents = [twoappart, eastside, heartandsoul, licky];

Resident modernicafull = Resident(
  image: CustomAssets.modernica,
  city: 'New York',
  rating: 4.8,
  prize: 29,
  perdayNight: 'night',
  name: 'Modernica\nApartment',
  favourite: false,
  description: '',
  countrytag: ' US',
);

Resident modernica = Resident(
  image: CustomAssets.modernica,
  city: 'New York',
  rating: 4.8,
  prize: 29,
  perdayNight: 'night',
  name: 'Modernica Apartme...',
  favourite: false,
  description: '',
  countrytag: ' US',
);

Resident merialla = Resident(
  image: CustomAssets.merialla,
  city: 'Paris',
  rating: 4.6,
  prize: 32,
  perdayNight: 'night',
  name: 'Merialla Villa',
  favourite: false,
  description: '',
  countrytag: 'France',
);

Resident grandmansion = Resident(
  image: CustomAssets.lagrand,
  city: 'Tokyo',
  rating: 4.7,
  prize: 36,
  perdayNight: 'night',
  name: 'La Grand Maison',
  favourite: false,
  description: '',
  countrytag: 'Japan',
);

Resident alphahousing = Resident(
  image: CustomAssets.alphahouse,
  city: 'Delhi',
  rating: 4.2,
  prize: 28,
  perdayNight: 'night',
  name: 'Alpha Housing',
  favourite: false,
  description: '',
  countrytag: 'India',
);

Resident millhouse = Resident(
  image: CustomAssets.millhouse,
  city: 'Shanghai',
  rating: 4.6,
  prize: 25,
  perdayNight: 'night',
  name: 'Mill House',
  favourite: false,
  description: '',
  countrytag: 'China',
);

Resident asstute = Resident(
  image: CustomAssets.astutue,
  city: 'Sau Paulo',
  rating: 4.3,
  prize: 32,
  perdayNight: 'night',
  name: 'Astute Homes',
  favourite: false,
  description: '',
  countrytag: 'Brazil',
);

Resident whiteCottage = Resident(
  image: CustomAssets.whitecottage,
  city: 'London',
  rating: 4.3,
  prize: 32,
  perdayNight: 'night',
  name: 'White Cottage',
  favourite: false,
  description: '',
  countrytag: 'UK ',
);

Resident carraigehouse = Resident(
  image: CustomAssets.carraigehouse,
  city: 'Osaka',
  rating: 4.0,
  prize: 27,
  perdayNight: 'night',
  name: 'Carriage House',
  favourite: false,
  description: '',
  countrytag: 'Japan ',
);

Resident meadowview = Resident(
  image: CustomAssets.meadowgroup,
  city: 'Washington',
  rating: 4.7,
  prize: 29,
  perdayNight: 'night',
  name: 'Meadow View',
  favourite: false,
  description: '',
  countrytag: 'US',
);

Resident sweetVilla = Resident(
  image: CustomAssets.sweatvilla,
  city: 'London',
  rating: 4.8,
  prize: 26,
  perdayNight: 'night',
  name: 'Sweet Villa',
  favourite: false,
  description: '',
  countrytag: 'Uk',
);

Resident twoappart = Resident(
  image: CustomAssets.meadowgroup,
  city: 'Osaka',
  rating: 4.0,
  prize: 27,
  perdayNight: 'night',
  name: 'Merialla Villa',
  favourite: true,
  description: '',
  countrytag: 'Japan',
);

Resident heartandsoul = Resident(
  image: CustomAssets.whitecottage,
  city: 'London',
  rating: 4.1,
  prize: 30,
  perdayNight: 'night',
  name: 'White Cottage',
  favourite: true,
  description: '',
  countrytag: 'Uk',
);

Resident licky = Resident(
  image: CustomAssets.alphahouse,
  city: 'New Delhi',
  rating: 4.2,
  prize: 28,
  perdayNight: 'night',
  name: 'Alpha Housing',
  favourite: true,
  description: '',
  countrytag: 'India',
);

Resident eastside = Resident(
  image: CustomAssets.sweatvilla,
  city: 'Tokyo',
  rating: 4.7,
  prize: 36,
  perdayNight: 'night',
  name: 'Meadow View',
  favourite: true,
  description: '',
  countrytag: 'Japan',
);
