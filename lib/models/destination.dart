import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String about;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final double rating;
  final int price;
  final List<dynamic>? interests;
  final List<dynamic>? photos;

  const DestinationModel({
    required this.id,
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.price,
    required this.interests,
    required this.photos,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'],
      city: json['city'],
      imageUrl: json['imageUrl'],
      about: json['about'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      rating: json['rating'].toDouble(),
      price: json['price'],
      interests: json['interests'],
      photos: json['photos'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'city': city,
    'imageUrl': imageUrl,
    'about': about,
    'rating': rating,
    'price': price,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      city,
      imageUrl,
      about,
      createdAt,
      updatedAt,
      rating,
      price,
      interests,
      photos,
    ];
  }
}
