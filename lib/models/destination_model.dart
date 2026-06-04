import 'place_model.dart';

// OOP Concept: Encapsulation
// All destination data is encapsulated inside this model class.
// OOP Concept: Inheritance
// DestinationModel extends PlaceModel, inheriting common fields.

class DestinationModel extends PlaceModel {
  final String category;
  final String shortDescription;
  final String fullDescription;
  final String ticketPrice;
  final String bestTimeToVisit;
  final List<String> activities;
  final List<String> tips;
  final String mapsUrl;
  final bool isFeatured;

  DestinationModel({
    required super.id,
    required super.name,
    required super.city,
    required super.imageUrl,
    required super.assetImage,
    required this.category,
    required this.shortDescription,
    required this.fullDescription,
    required this.ticketPrice,
    required this.bestTimeToVisit,
    required this.activities,
    required this.tips,
    required this.mapsUrl,
    this.isFeatured = false,
  });

  // OOP Concept: Polymorphism - overrides the abstract method from PlaceModel
  @override
  String getDisplayInfo() {
    return '$name | $city | $category | $ticketPrice';
  }
}
