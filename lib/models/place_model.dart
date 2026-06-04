// OOP Concept: Abstraction
// PlaceModel is an abstract base class that defines the common structure
// for any place in the app. It cannot be instantiated directly.

abstract class PlaceModel {
  final int id;
  final String name;
  final String city;
  final String imageUrl;
  final String assetImage;

  PlaceModel({
    required this.id,
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.assetImage,
  });

  // OOP Concept: Polymorphism
  // Each subclass must override this method to return its own display info.
  String getDisplayInfo();
}
