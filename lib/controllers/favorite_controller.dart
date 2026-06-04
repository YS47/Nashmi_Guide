import '../models/destination_model.dart';

class FavoriteController {
  final List<DestinationModel> _favorites = [];

  void addFavorite(DestinationModel destination) {
    if (!isFavorite(destination.id)) {
      _favorites.add(destination);
    }
  }

  void removeFavorite(int id) {
    _favorites.removeWhere((d) => d.id == id);
  }

  bool isFavorite(int id) {
    return _favorites.any((d) => d.id == id);
  }

  List<DestinationModel> getFavorites() {
    return List.unmodifiable(_favorites);
  }

  void toggleFavorite(DestinationModel destination) {
    if (isFavorite(destination.id)) {
      removeFavorite(destination.id);
    } else {
      addFavorite(destination);
    }
  }
}
